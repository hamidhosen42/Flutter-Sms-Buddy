// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_buddy/core/services/api_services.dart';

class QuoteScreen extends StatefulWidget {
  String categoryName;
  String categoryID;
  QuoteScreen(
      {super.key, required this.categoryName, required this.categoryID});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  // List quoteLists = [
  //   {
  //     'quote':
  //         'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
  //     'author': 'Hamid Hosen'
  //   },
  //   {
  //     'quote':
  //         'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
  //     'author': 'Hamid Hosen'
  //   },
  //   {
  //     'quote':
  //         'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
  //     'author': 'Hamid Hosen'
  //   },
  //   {
  //     'quote':
  //         'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
  //     'author': 'Hamid Hosen'
  //   },
  //   {
  //     'quote':
  //         'The pain is not on the day of missing our dear ones. The pain is really when you live without them and with their presence in your mind.',
  //     'author': 'Hamid Hosen'
  //   },
  // ];

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
        body: FutureBuilder(
            future: ApiServices.getQuotes(widget.categoryID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: Lottie.asset('assets/json/loading.json',
                width: 200, height:200),);
              } else {
                return Padding(
                    padding: EdgeInsets.all(12),
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        primary: true,
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
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
                                    Text(
                                      data.story.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      data.author.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.copy),
                                        Icon(Icons.share)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }));
              }
            }));
  }
}