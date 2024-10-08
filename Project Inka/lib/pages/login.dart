import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _namaController = TextEditingController();
    final TextEditingController _divisiController = TextEditingController();
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
        body: LayoutBuilder(
          builder: (context, constraints) {
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
                )),
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
                ),
                //Text
                Positioned(
                    top: parentHeight * 0.38, // Jarak dari atas layar
                    right: parentWidth * 0.1, // Jarak dari sisi kanan layar
                    left: parentWidth * 0.18, // Jarak dari sisi kiri layar
                    child: Text(
                      "STRESS MONITORING",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                //Button User
                Positioned(
                  top: parentHeight * 0.45,
                  left: parentWidth * 0.3,
                  right: parentWidth * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Back ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Warna latar tombol
                      foregroundColor: Colors.black, // Warna teks tombol
                      padding: EdgeInsets.symmetric(
                          horizontal: 50, vertical: 0.5), // Ukuran padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Border persegi dengan sudut melengkung
                      ),
                    ),
                    child: Text(
                      'USER',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                //Input Nama
                Positioned(
                    bottom: parentHeight * 0.35,
                    left: parentWidth * 0.1,
                    right: parentWidth * 0.1,
                    child: Container(
                        width: 1,
                        child: TextField(
                          //Entry Box Nama
                          controller: _namaController,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ))),

                //Input Divisi
                Positioned(
                    bottom: parentHeight * 0.25,
                    left: parentWidth * 0.1,
                    right: parentWidth * 0.1,
                    child: Container(
                        width: 1,
                        child: TextField(
                          //Entry Box Nama
                          controller: _divisiController,
                          decoration: InputDecoration(
                            labelText: 'Divisi',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ))),
                //Button Submit
                Positioned(
                  bottom: parentHeight * 0.1,
                  left: parentWidth * 0.3,
                  right: parentWidth * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Back ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Warna latar tombol
                      foregroundColor: Colors.black, // Warna teks tombol
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0.5), // Ukuran padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Border persegi dengan sudut melengkung
                      ),
                    ),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
