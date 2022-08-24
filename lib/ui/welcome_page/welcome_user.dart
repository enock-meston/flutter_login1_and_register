import 'package:flutter_login1_and_register/ui/details/details.dart';

import '../../service/service.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Service getdataService = Service();

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
          FutureBuilder<List>(
              // Getting users from database
              future: getdataService.getData(),
              builder: (ctx, ss) {
                if (ss.hasError) {
                  print("Error");
                }
                if (ss.hasData) {
                  return Expanded(child: Items(list: ss.data));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  List? list;
  Items({
    Key? key,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            leading: GestureDetector(child: Icon(Icons.edit)),
            title: Text(list![i]['names']),
            subtitle: Text(list![i]['phone']),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailsPage(
                            index: i,
                            list: list,
                          )));
            },
          );
        });
  }
}
