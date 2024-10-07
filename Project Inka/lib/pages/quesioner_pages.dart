import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class QuesionerPages extends StatelessWidget {
  const QuesionerPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Quesioner"),
      ),
      body: Center(
        child: Text(
          'Selamat datang di halaman Quesioner!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}