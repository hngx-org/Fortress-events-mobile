import 'package:flutter/material.dart';
import 'package:event_app/src/features/comment_section/post_events_comments.dart';
import 'package:event_app/src/features/comment_section/pre_events_comments.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  int toggleSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: 
          Container(
            decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              //physics: const NeverScrollableScrollPhysics(),
              child: Column(
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
                  const SizedBox(height: 20),
                  FlutterToggleTab(
                    height: 70,
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
                    child: Center(
                        child: (toggleSelectedIndex == 0)
                            ? const PreScreen()
                            : const PostScreen()),
                  ),
                       Container(
                    color: Colors.grey.shade100,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.message),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: const Text('message'),
                              hintText: 'Write a message',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
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
                        const SizedBox(width: 20),
                        const Icon(Icons.send),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ),
        
    );
  }
}
