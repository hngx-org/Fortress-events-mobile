import 'dart:convert';

import 'package:event_app/src/core/helper_fxn.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/features/auth/notifiers/user_notifier.dart';
import 'package:event_app/src/features/comment_screen/model/comment_body.dart';
import 'package:event_app/src/features/comment_screen/model/post_comment_resp/post_comment_resp.dart';
import 'package:event_app/src/features/comment_screen/model/post_comments/post_comments.dart';
import 'package:event_app/src/features/comment_screen/notifiers/comments_notifier.dart';
import 'package:event_app/src/features/comment_screen/post_events_comments.dart';
import 'package:event_app/src/features/comment_screen/pre_events_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class CommentScreen extends ConsumerStatefulWidget {
  const CommentScreen({super.key, required this.eventId});
  final String eventId;

  @override
  ConsumerState<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends ConsumerState<CommentScreen> {
  final TextEditingController _commentContrl = TextEditingController();
  int toggleSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userNotifierProvider);
    final api = ref.read(apiServicesProvider);

    return FractionallySizedBox(
      heightFactor: 0.93,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ListView(
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Comments',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Icon(Icons.share)
                      ])),
              const SizedBox(height: 10),
              FlutterToggleTab(
                height: 40,
                selectedBackgroundColors: const [Color(0xffCFFF92)],
                unSelectedBackgroundColors: const [Colors.white],
                isScroll: false,
                selectedTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                unSelectedTextStyle:
                    const TextStyle(color: Colors.grey, fontSize: 20),
                borderRadius: 0,
                labels: const ["Pre Event", "Post Event"],
                selectedIndex: toggleSelectedIndex,
                begin: Alignment.centerLeft,
                end: Alignment.center,
                selectedLabelIndex: (index) {
                  setState(() {
                    toggleSelectedIndex = index;
                  });
                },
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        child: (toggleSelectedIndex == 0)
                            ? PreScreen(
                                eventId: widget.eventId,
                              )
                            : const PostScreen()),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.image_rounded),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: _commentContrl,
                        decoration: InputDecoration(
                          label: const Text('Add a comment'),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: Color.fromARGB(255, 1, 32, 10),
                            ),
                            onPressed: () async {
                              if (_commentContrl.text.isNotEmpty) {
                                final data = CommentBody(
                                    body: _commentContrl.text,
                                    eventId: widget.eventId,
                                    userId: userData.resp?.id ?? "");

                                final PostCommentResp comments =
                                    await api.postComments(
                                        body: data, eventId: widget.eventId, );

                                toastMessage(comments.message ?? '');
                                ref.watch(commentProvider).copyWith(resp: [
                                  ...[
                                    PostComments(
                                        body: comments.newComment?.body ?? "",
                                        id: comments.newComment?.id ?? '',  )
                                  ]
                                ]);
                                _commentContrl.clear();
                                setState(() {});
                              }
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
