// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sms_buddy/screen/quote_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List smsStatusList = [
    {"status": "Birthday", "icon": "assets/image/birthday.png"},
    {"status": "Love", "icon": "assets/image/love.png"},
    {"status": "Motivational", "icon": "assets/image/motivational.png"},
    {"status": "BreakUps", "icon": "assets/image/sad.png"},
  ];
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: BouncingScrollPhysics(),
                  itemCount: smsStatusList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuoteScreen(
                                categoryName: smsStatusList[index]['status'])));
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1, color: Colors.green)),
                        child: Column(
                          children: [
                            Image.asset(
                              smsStatusList[index]['icon'],
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              smsStatusList[index]['status'],
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}