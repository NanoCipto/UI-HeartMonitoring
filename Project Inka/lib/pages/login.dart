import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(94, 169, 246, 1),
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
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        //Layout Builder
        final parentWidth = constraints.maxWidth;
        final parentHeight = constraints.maxHeight;
        
        return Stack(
          children: [
            //Background SVG
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/icons/background.svg', 
                fit: BoxFit.cover,
                )
              ),
            //Icon Man
            Positioned(
              top: parentHeight * 0.01,
              bottom: parentHeight * 0.6,
              left: parentWidth * 0.25,
              right: parentWidth * 0.25,
              // right: parentWidth * 0.5,
              child: Image.asset(
                'assets/icons/man.png',
                scale: 1,
              ),
            )
            //Icon 2

            //Button 1

            //Button 2
          ],
        );
      },
      )
    );
  }
}