import 'package:flutter/material.dart';

class ScrrenHomePage extends StatelessWidget {
  const ScrrenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.red,
      //change height
      height: height / 2,
      width: width / 1,
      child: Container(),
    );
  }
}
