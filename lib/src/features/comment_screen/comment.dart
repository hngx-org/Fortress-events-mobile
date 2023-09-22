import 'package:event_app/src/features/comment_screen/post_events_comments.dart';
import 'package:event_app/src/features/comment_screen/pre_events_comments.dart';
import 'package:flutter/material.dart';
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
                            ? const PreScreen()
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
                        decoration: InputDecoration(
                          label: const Text('Add a comment'),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.send, 
                              color: Color.fromARGB(255, 1, 32, 10), 
                            ),
                            onPressed: () {
                              // Add the action you want to perform when the button is pressed
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
