import 'package:flutter/material.dart';

class Upcamming extends StatelessWidget {
  const Upcamming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Image.asset("assets/images/upcamming.jpg")



        ],),
      ),
    );
  }
}
