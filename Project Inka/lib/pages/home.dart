import 'package:fitness/pages/hrvpages_old.dart';
import 'package:fitness/pages/quesioner_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final String nama;
  final String divisi;
  final Map<String, dynamic>? collectedData;

  HomePage({required this.nama, required this.divisi, this.collectedData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCollectedData = false;
  @override
  Widget build(BuildContext context) {
    final collectedData = widget.collectedData ?? {};
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
        body: LayoutBuilder(builder: (context, constraints) {
          // Layout Builder
          final parentWidth = constraints.maxWidth;
          final parentHeight = constraints.maxHeight;

          return Stack(
            children: [
              // Background SVG yang responsif
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/icons/background_3.svg',
                  fit: BoxFit.cover, // Agar gambar menyesuaikan dengan layar
                ),
              ),

              // Tombol HRV bulat di kiri atas agak ke tengah
              Positioned(
                top: parentHeight * 0.05, // Jarak dari atas layar
                left: parentWidth * 0.05, // Jarak dari sisi kiri layar
                right: parentWidth * 0.5, // Jarak dari sisi kanan layar
                // right : parentWidth * 0.7, // Jarak dari sisi kiri layar
                child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol bulat ditekan
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeviceScanScreen(
                                  nama: widget.nama,
                                  divisi: widget.divisi) //Menuju ke Halaman Hrv
                              ));
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.white, // Warna latar tombol
                      shape: CircleBorder(), // Membuat tombol berbentuk bulat
                      padding: EdgeInsets.all(5), // Ukuran padding untuk membuat tombol bulat
                      elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                      shadowColor: Colors.black, // Warna bayangan (opsional)
                    ),
                    child: Transform.scale(
                      scale: 0.9,
                      child: SvgPicture.asset('assets/icons/HRV.svg'),
                    )),
              ),
              Positioned(
                  top: parentHeight * 0.1, // Jarak dari atas layar
                  right: parentWidth * 0.1, // Jarak dari sisi kanan layar
                  left: parentWidth * 0.53, // Jarak dari sisi kiri layar
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeviceScanScreen(
                                    nama: widget.nama,
                                    divisi: widget.divisi,
                                  )));
                    },
                    child: Text(
                      "CEK HRV",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              // Tombol Back bulat di kiri bawah agak ke tengah
              Positioned(
                top: parentHeight * 0.29, // Jarak dari atas layar
                left: parentWidth * 0.05, // Jarak dari sisi kiri layar
                right: parentWidth * 0.5, // Jarak dari sisi kanan layar
                child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol bulat ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuesionerPages(
                                collectedData:
                                    collectedData) //Menuju ke Halaman Hrv
                            ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.white, // Warna latar tombol
                      shape: CircleBorder(), // Membuat tombol berbentuk bulat
                      padding: EdgeInsets.all(5), // Ukuran padding untuk membuat tombol bulat
                      elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                      shadowColor: Colors.black, // Warna bayangan (opsional)
                    ),
                    child: Transform.scale(
                      scale: 0.9,
                      child: SvgPicture.asset('assets/icons/QUIZ.svg'),
                    )),
              ),
              Positioned(
                  top: parentHeight * 0.34, // Jarak dari atas layar
                  right: parentWidth * 0.1, // Jarak dari sisi kanan layar
                  left: parentWidth * 0.45, // Jarak dari sisi kiri layar
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuesionerPages(
                                    collectedData: collectedData)));
                      },
                      child: Text(
                        "QUESIONER",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),

              // Tombol untuk menampilkan collectedData
              // Positioned(
              //   top: parentHeight * 0.6, // Posisi tombol di layar
              //   left: parentWidth * 0.1,
              //   right: parentWidth * 0.1,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         showCollectedData =
              //             !showCollectedData; // Toggle tampil data
              //       });
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.blueAccent,
              //       padding: EdgeInsets.symmetric(
              //           horizontal: 80, vertical: 12), // Ukuran padding
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //     child: Text(
              //       showCollectedData ? 'Hide Data' : 'Show Collected Data',
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),

              // Tampilkan data jika tombol ditekan
              // if (showCollectedData)
              //   Positioned(
              //     top: parentHeight * 0.7,
              //     left: parentWidth * 0.1,
              //     right: parentWidth * 0.1,
              //     child: Container(
              //       padding: EdgeInsets.all(10),
              //       color: Colors.white.withOpacity(0.8),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: collectedData.entries
              //             .map((entry) => Padding(
              //                   padding:
              //                       const EdgeInsets.symmetric(vertical: 5),
              //                   child: Text(
              //                     '${entry.key}: ${entry.value}',
              //                     style: TextStyle(
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ))
              //             .toList(),
              //       ),
              //     ),
              //   ),

              // Tombol Back di atas background
              Positioned(
              bottom: parentHeight * 0.1,
              left: parentWidth * 0.22,
              right: parentWidth * 0.22,
              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke halaman pertama
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                  shadowColor: Colors.black, // Warna bayangan (opsional)
                  minimumSize: Size(100, 50)
                ),
                child: Text(
                  'KEMBALI',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 61, 111)),
                ),
              ),
            )
            ],
          );
        }));
  }
}
//Coba