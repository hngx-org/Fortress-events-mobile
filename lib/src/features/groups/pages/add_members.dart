import 'package:flutter/material.dart';

class MemberArray extends StatefulWidget {
  const MemberArray({super.key});

  @override
  State<MemberArray> createState() => _MemberArrayState();
}

class _MemberArrayState extends State<MemberArray> {
  List<String> items = []; // Initialize an empty list to hold items

  // Function to add an item to the list
  void addItemToList(String newItem) {
    setState(() {
      items.add(newItem);
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}