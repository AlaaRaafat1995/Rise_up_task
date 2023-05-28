import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rise_up_task/Services/add_user.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/functions.dart';

class Api {
  Future get({required String url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data;
      }
    } on Exception catch (e) {
      throw Exception("there is an exception StatusCode : $e");
    }
  }

  Future post(
      {required String url,
      required dynamic body,
      required BuildContext context}) async {
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: {
      "Authorization": "Bearer $token",
    });

    try {
      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      }
      if (response.statusCode == 422) {
        return snake(context, "This E-mail has already been taken");
      }
    } on Exception catch (e) {
      throw Exception("there is an exception : $e");
    }
  }

  Future put(
      {required String url,
      @required dynamic body,
      required BuildContext context}) async {
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: {
      "Authorization": "Bearer $token",
    });
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        return data;
      }
      if (response.statusCode == 422) {
        return snake(context, "This E-mail has already been taken");
      }
    } on Exception catch (e) {
      throw Exception(
          "there is an exception StatusCode : ${response.statusCode}");
    }
  }

  Future<void> delete({
    required String url,
  }) async {
    try {
      await http.delete(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
      });
    } on Exception catch (e) {
      throw Exception("there is an exception : $e");
    }
  }
}
