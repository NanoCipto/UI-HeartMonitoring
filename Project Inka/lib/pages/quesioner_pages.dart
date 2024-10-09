import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuesionerPages extends StatelessWidget {
  const QuesionerPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(94, 169, 246, 1),
          title: Center(
            child: Text(
              'Quesioner',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: Container(
            margin: EdgeInsets.all(10), // Jarak tombol dari tepi
            child: ElevatedButton(
              onPressed: () {
                // Navigator Pop untuk kembali ke menu sebelumnya
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF7F8F8), // Warna latar tombol
                padding: EdgeInsets.all(10), // Padding di dalam tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bentuk sudut bulat
                ),
              ),
              child: SvgPicture.asset(
                'assets/icons/Arrow - Left 2.svg', // Gambar ikon panah kiri
                width: 24, // Lebar ikon
                height: 24, // Tinggi ikon
              ),
            ),
          ),
          actions: [Padding(
            //Logo Quesioner
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset(
                'assets/icons/QUIZ.svg',
              ),
            ),
          )],
        ),
        
      body: Container(
        color: Color.fromRGBO(94, 169, 246, 1),
      )
          // Layout Builder
          // final parentWidth = constraints.maxWidth;
          // final parentHeight = constraints.maxHeight;
           
        );
  }
}