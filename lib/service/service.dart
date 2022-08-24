import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constant.dart';
import '../ui/welcome_page/welcome_user.dart';

class Service {
  Future loginMethod(
      BuildContext context, String email, String password) async {
    var url = "http://10.0.2.2/flutterapi/login.php";
    var response = await http
        .post(Uri.parse(url), body: {"email": email, "password": password});

    var data = jsonDecode(response.body);
    if (data == "Logged_In") {
      Fluttertoast.showToast(
          msg: "logged In",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      // open new navigator
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const WelcomePage()));
    } else {
      Fluttertoast.showToast(
          msg: "User not registed with Us !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future register(String user, String pass) async {
    var url = "http://10.0.2.2/flutterapi/create.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": user,
      "password": pass,
    });

    var data = jsonDecode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "This user Already Exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "User Successful Added!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  String url = '/flutterapi/list.php';
  Future<List> getData() async {
    final response = await http.get(Uri.parse('$host$url'));
    return jsonDecode(response.body);
  }
}
