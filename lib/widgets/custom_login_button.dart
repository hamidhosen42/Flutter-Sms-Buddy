// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget customButton({required String level}){
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Center(
      child: Text(level,style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
    ),
  );
}