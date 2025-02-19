import 'package:flutter/material.dart';
import 'dart:math';
import 'package:test1/BaseAppBar.dart';
import 'package:test1/basic_text.dart';

class Gridviewpage extends StatelessWidget {
  const Gridviewpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5, //세로마진
          crossAxisSpacing: 5, //가로마진진
        ),
        children: [
          for (int i = 1; i < 10; i++)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/300"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
