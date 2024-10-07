import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(94, 169, 246, 1),
        leading: Container(
          margin: EdgeInsets.all(10),
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
          decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      body: Stack(
        children: [
          // Background SVG yang responsif
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/icons/background.svg',
              fit: BoxFit.cover, // Agar gambar menyesuaikan dengan layar
            ),
          ),
          // Tombol Back bulat di kiri atas agak ke tengah
          Positioned(
            top: 30, // Jarak dari atas layar
            left: 60, // Jarak dari sisi kiri layar
            child: ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol bulat ditekan
              },
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.white, // Warna latar tombol
                shape: CircleBorder(), // Membuat tombol berbentuk bulat
                padding: EdgeInsets.all(10), // Ukuran padding untuk membuat tombol bulat
              ),
              child: Transform.scale(
                scale: 1,
                child: SvgPicture.asset('assets/icons/HRV.svg'),
              )
            ),
          ),
          // Tombol Back bulat di kiri bawah agak ke tengah
          Positioned(
            top: 170, // Jarak dari atas layar
            left: 60, // Jarak dari sisi kiri layar
            child: ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol bulat ditekan
              },
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.white, // Warna latar tombol
                shape: CircleBorder(), // Membuat tombol berbentuk bulat
                padding: EdgeInsets.all(10), // Ukuran padding untuk membuat tombol bulat
              ),
              child: Transform.scale(
                scale: 1,
                child: SvgPicture.asset('assets/icons/QUIZ.svg'),
              )
            ),
          ),
          // Tombol Back di atas background
          Positioned(
            bottom: 80, // Atur jarak tombol dari bawah layar
            left: 0,
            right: 0,
            child: Center(
              child : ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol Back ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Warna latar tombol
                foregroundColor: Colors.black, // Warna teks tombol
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12), // Ukuran padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Border persegi dengan sudut melengkung
                ),
              ),
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 61, 111)),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}

//Coba