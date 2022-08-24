import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  List? list;
  int index;
  DetailsPage({
    Key? key,
    this.list,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list![widget.index]['names']),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Text(
              widget.list![widget.index]['names'],
              style: const TextStyle(fontSize: 20),
            ),
             Text(widget.list![widget.index]['email'],
                style: const TextStyle(fontSize: 20)),
            Text(widget.list![widget.index]['phone'],
                style: const TextStyle(fontSize: 20)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(onPressed: () {}, child: const Text('Edith')),
              ElevatedButton(onPressed: () {}, child: const Text('Delete'))
            ])
          ],
        )),
      ),
    );
  }
}
