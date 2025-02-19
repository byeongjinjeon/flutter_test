import 'package:flutter/material.dart';
import '/til_button.dart';
import 'package:test1/gridview_wedget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> list = [
    TilButton(title: 'GridView', routeName: '/gridview2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter TIL')),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return list[index];
        },
      ),
    );
  }
}
