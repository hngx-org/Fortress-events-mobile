import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/features/comment_screen/notifiers/comments_notifier.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_app/src/features/comment_screen/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreScreen extends ConsumerStatefulWidget {
  const PreScreen({super.key, required this.eventId});
  final String eventId;

  @override
  ConsumerState<PreScreen> createState() => _PreScreenState();
}

class _PreScreenState extends ConsumerState<PreScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(commentProvider.notifier).getComments(widget.eventId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentProvider);

    return state.loadState == LoadState.loading
        ? CupertinoActivityIndicator(
            color: AppColors.primary1000,
          )
        : (state.resp ?? []).isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacing.height(50),
                  CustomImageView(
                    height: 150,
                    width: 150,
                    imagePath: 'assets/images/emptyList.png',
                  ),
                  const Spacing.largeHeight(),
                ],
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: state.resp?.length ?? 0,
                itemBuilder: (ctx, index) {
                  var item = comments[index];
                  final data = state.resp?[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: CustomImageView(
                              height: 30,
                              width: 30,
                              radius: BorderRadius.circular(15),
                              fit: BoxFit.cover,
                              url: data?.avatar ?? '',
                            ),

                            //  CircleAvatar(
                            //     child: Image.asset('assets/images/${item.photo}')),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF2F4F7),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '@${data?.user!.replaceAll(' ', '').toLowerCase() ?? ''}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(data?.body ?? ""),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(item.time,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13)),
                                      const SizedBox(width: 10),
                                      Text('Like',
                                          style: TextStyle(
                                              fontWeight: (item.isLiked)
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              fontSize: 13,
                                              color: (item.isLiked)
                                                  ? const Color(0xff063B27)
                                                  : Colors.grey)),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'Reply',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  (item.hasPicture)
                                      ? Image.asset(
                                          'assets/images/${item.picture}')
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
  }
}
