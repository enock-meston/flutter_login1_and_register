// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Future getData() async {
    var url = "http://192.168.71.1:8080/flutterApi/list.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  List? list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Center(child: const Text("Data List")),
          
          FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              // ignore: avoid_print
              if (snapshot.hasError) print(snapshot.hasError);
              return snapshot.hasData
                  ? ListView.builder(
                      // itemCount: snapshot.data.length,
                      itemCount: list == null ? 0 : list!.length,
                      itemBuilder: (context, index) {
                        list = snapshot.data;
                        return ListTile(
                          leading: GestureDetector(
                            child: Icon(Icons.edit),
                            onTap: () {
                              debugPrint('Edit Clicked');
                            },
                          ),
                          title: Text(list![index]['names']),
                        );
                      })
                  : CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
