import 'package:flutter/material.dart';
import 'package:event_app/src/model.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: comments.length,
        itemBuilder: (ctx, index) {
          var item = comments[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: CircleAvatar(
                        child: Image.asset('assets/images/${item.photo}')),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.handle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(item.comment),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(item.time,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 13)),
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
                            ],
                          ),
                          const SizedBox(height: 5),
                          (item.hasPicture)
                              ? Image.asset('assets/images/${item.picture}')
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
