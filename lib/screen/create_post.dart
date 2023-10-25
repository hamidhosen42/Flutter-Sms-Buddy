// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sms_buddy/screen/home_screen.dart';
import 'package:sms_buddy/utils/utils.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  List quoteCategoriList = ['Birthday', 'Love', 'Motivational', 'BreakUps'];

  String slectedItem = "Birthday";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Create Post",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: Text(
                "Post",
                style: Utils.style,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
         child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Post Category",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton(
                      value: slectedItem,
                      items: quoteCategoriList.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          slectedItem = value as String;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                indent: 15,
                endIndent: 15,
                thickness: 1,
                color: Colors.green,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Story:",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: TextField(
                  minLines: 5,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Enter your story here....",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}