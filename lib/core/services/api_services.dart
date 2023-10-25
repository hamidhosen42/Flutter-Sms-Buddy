// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sms_buddy/model/category_mode.dart';
import 'package:sms_buddy/model/quotes_mode.dart';
import 'package:sms_buddy/utils/app_urls.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // !=================CategoryModel================
  static Future<List<CategoryModel>?> getCategories() async {
    final Uri apiEndpoint = Uri.parse('${AppUrls.apiUrl}/categories');
    final request = await http.get(apiEndpoint);

    if (request.statusCode == 200) {
      return categoryModelFromJson(request.body);
    } else {
      CircularProgressIndicator(
        color: Colors.red,
      );
    }
    return null;
  }

  // !===============QuotesModel====================
  static Future<List<QuotesModel>?> getQuotes(String id) async {
    final Uri apiEndpoint = Uri.parse('${AppUrls.apiUrl}/stories/$id');
    final request = await http.get(apiEndpoint);

    if (request.statusCode == 200) {
      return quotesModelFromJson(request.body);
    } else {
      CircularProgressIndicator(
        color: Colors.red,
      );
    }
    return null;
  } 
}
