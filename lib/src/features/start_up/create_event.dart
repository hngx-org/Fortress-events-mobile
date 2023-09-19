import 'package:flutter/material.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: ListTile(
              title: Text("Create Event"),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title"),
                CustomContainerTextField(
                  boxheight: MediaQuery.sizeOf(context).height * 0.06,
                  boxwidth: MediaQuery.sizeOf(context).width,
                  item: "Add Event Title",
                  theradius: BorderRadius.circular(12),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.04,
                ),
                CustomContainerTextField(
                  boxheight: MediaQuery.sizeOf(context).height * 0.2,
                  boxwidth: MediaQuery.sizeOf(context).width,
                  theradius: BorderRadius.circular(20),
                  item: "Add Event Title",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text("Date"),
                        Text("Fin")
                      ],
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.4,),
                    Column(
                      children: [
                        Text("Date"),
                        Text("Fin")
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainerTextField extends StatelessWidget {
  final double? boxheight;
  final String? item;
  final double? boxwidth;
  final BorderRadius? theradius;
  const CustomContainerTextField(
      {super.key, this.boxheight, this.item, this.boxwidth, this.theradius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxheight,
      width: boxwidth,
      decoration: BoxDecoration(
        borderRadius: theradius,
        color: Colors.white10,
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        decoration: InputDecoration(labelText: item),
      ),
    );
  }
}
