import 'package:fitness/pages/hrv_pages.dart';
import 'package:fitness/pages/quesioner_pages.dart';
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
        margin: EdgeInsets.all(10), // Jarak tombol dari tepi
        child: ElevatedButton(
          onPressed: () {
            // Navigator Pop untuk kembali ke menu sebelumnya
            // Navigator.pop(context);
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
      body: Stack(
        children: [
          // Background SVG yang responsif
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/icons/background.svg',
              fit: BoxFit.cover, // Agar gambar menyesuaikan dengan layar
            ),
          ),

          // Tombol HRV bulat di kiri atas agak ke tengah
          Positioned(
            top: 30, // Jarak dari atas layar
            left: 80, // Jarak dari sisi kiri layar
            child: ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol bulat ditekan
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HrvPages() //Menuju ke Halaman Hrv
                          ));
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.white, // Warna latar tombol
                  shape: CircleBorder(), // Membuat tombol berbentuk bulat
                  padding: EdgeInsets.all(
                      5), // Ukuran padding untuk membuat tombol bulat
                ),
                child: Transform.scale(
                  scale: 0.9,
                  child: SvgPicture.asset('assets/icons/HRV.svg'),
                )),
          ),
          Positioned(
              top: 55, // Jarak dari atas layar
              right: 100, // Jarak dari sisi kiri layar
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HrvPages()));
                },
                child: Text(
                  "CEK HRV",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
          // Tombol Back bulat di kiri bawah agak ke tengah
          Positioned(
            top: 170, // Jarak dari atas layar
            left: 80, // Jarak dari sisi kiri layar
            child: ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol bulat ditekan
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuesionerPages() //Menuju ke Halaman Hrv
                          ));
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.white, // Warna latar tombol
                  shape: CircleBorder(), // Membuat tombol berbentuk bulat
                  padding: EdgeInsets.all(
                      5), // Ukuran padding untuk membuat tombol bulat
                ),
                child: Transform.scale(
                  scale: 0.9,
                  child: SvgPicture.asset('assets/icons/QUIZ.svg'),
                )),
          ),
          Positioned(
              top: 200, // Jarak dari atas layar
              right: 75, // Jarak dari sisi kiri layar
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuesionerPages()));
                },
                child : Text(
                  "QUESIONER",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              ))),
          // Tombol Back di atas background
          Positioned(
            bottom: 80, // Atur jarak tombol dari bawah layar
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol Back ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna latar tombol
                  foregroundColor: Colors.black, // Warna teks tombol
                  padding: EdgeInsets.symmetric(
                      horizontal: 80, vertical: 12), // Ukuran padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Border persegi dengan sudut melengkung
                  ),
                ),
                child: Text(
                  'BACK',
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