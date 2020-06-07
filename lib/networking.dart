import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else
      print(response.statusCode);
  }

  Future postData(var userId, var title, var body) async {
    Response response = await http.post(
      url,
      headers: <String, String>{
        "Content-type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        title: title,
        body: body,
        userId: userId,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else
      print(response.statusCode);
  }
}
