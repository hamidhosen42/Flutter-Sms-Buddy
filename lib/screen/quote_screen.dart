// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  String categoryName;
  QuoteScreen({super.key, required this.categoryName});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {

  List quoteLists = [
    {
      'quote' : 'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
      'author':'Hamid Hosen'
    },
    {
      'quote' : 'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
      'author':'Hamid Hosen'
    },
    {
      'quote' : 'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
      'author':'Hamid Hosen'
    },
    {
      'quote' : 'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
      'author':'Hamid Hosen'
    },
    {
      'quote' : 'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
      'author':'Hamid Hosen'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      appBar: AppBar(
        title: Text(
          widget.categoryName.toString(),
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView.builder(
              itemCount: quoteLists.length,
              shrinkWrap: true,
              primary: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.7),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(quoteLists[index]['quote'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(
                            height: 15,
                          ),
                          Text(quoteLists[index]['author'],style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Icon(Icons.copy), Icon(Icons.share)],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}