import 'package:stressmonitoringapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  // void _savetoDict() {

  // }
  @override
  Widget build(BuildContext context) {
    final TextEditingController _namaController = TextEditingController();
    final TextEditingController _divisiController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                  'assets/icons/background_3.svg',
                  fit: BoxFit.cover,
                )),
                //Icon Engineer
                Positioned(
                  top: parentHeight * 0.01,
                  bottom: parentHeight * 0.6,
                  left: parentWidth * 0.18,
                  right: parentWidth * 0.18,
                  // right: parentWidth * 0.5,
                  child: Image.asset(
                    'assets/icons/engineer.png',
                    scale: 0.01,
                  ),
                ),
                //Text
                Positioned(
                    top: parentHeight * 0.34, // Jarak dari atas layar
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
                  top: parentHeight * 0.54,
                  left: parentWidth * 0.38,
                  right: parentWidth * 0.38,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Back ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Warna latar tombol
                      foregroundColor: Colors.black, // Warna teks tombol
                      elevation: 4, // Nilai elevasi untuk menambahkan bayangan
                      shadowColor: Colors.black, // Warna bayangan (opsional)
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0.5), // Ukuran padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Border persegi dengan sudut melengkung
                      ),
                    ),
                    child: Text(
                      'USER',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                //Input Nama
                Positioned(
                    bottom: parentHeight * 0.265,
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
                    bottom: parentHeight * 0.18,
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
                      String nama = _namaController.text;
                      String divisi = _divisiController.text;
                      // Aksi ketika tombol Submit ditekan
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                  nama: nama,
                                  divisi: divisi) //Menuju ke Halaman Hrv
                              ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Warna latar tombol
                      foregroundColor: Colors.black, // Warna teks tombol
                      elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                      shadowColor: Colors.black, // Warna bayangan (opsional)
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
