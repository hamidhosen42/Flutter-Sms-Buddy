// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_buddy/screen/home_screen.dart';
import 'package:sms_buddy/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.3,
            ),
            Lottie.asset('assets/json/splash_lottie.json',
                width: size.width, height: size.height * 0.5),
            Column(
              children: [
                Text(
                  Utils.appName,
                  style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 1,
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "Version: 1.0",
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}