import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("تطابق"),
        backgroundColor: const Color.fromARGB(255, 122, 0, 144),
      ),
      body: ImageWidget(),
    ),
  ));
}

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  int leftImageNumber = 1;
  int rightImageNumber = 1;
  void generateRandomNumbers() {
    leftImageNumber = Random().nextInt(8) + 1;
    rightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.purple[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(leftImageNumber==rightImageNumber?'مبروك لقد كسبت' : 'حاول مرة اخرى', style: TextStyle(fontSize: 50.0)),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      generateRandomNumbers();
                    });
                  },
                  child: Image.asset('images/image-$rightImageNumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('images/image-$leftImageNumber.png'),
                  onPressed: () {
                    setState(() {
                      generateRandomNumbers();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
