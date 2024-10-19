import 'package:stressmonitoringapp/pages/admin.dart';
import 'package:stressmonitoringapp/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
                //Logo INKA
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'assets/icons/INKA.png',
                  ),
                ))
          ],
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

                //Button to Admin Menu
                Positioned(
                  bottom: parentHeight * 0.2,
                  left: parentWidth * 0.3,
                  right: parentWidth * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Back ditekan
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Warna latar tombol
                      foregroundColor: Colors.black, // Warna teks tombol
                      elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                      shadowColor: Colors.black, // Warna bayangan (opsional)
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Ukuran padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Border persegi dengan sudut melengkung
                      ),
                    ),
                    child: Text(
                      'ADMIN',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 61, 111)),
                    ),
                  ),
                ),

                //Button to User Menu
                Positioned(
                  bottom: parentHeight * 0.1,
                  left: parentWidth * 0.3,
                  right: parentWidth * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Back ditekan
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Warna latar tombol
                      foregroundColor: Colors.black, // Warna teks tombol
                      elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                      shadowColor: Colors.black, // Warna bayangan (opsional)
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Ukuran padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Border persegi dengan sudut melengkung
                      ),
                    ),
                    child: Text(
                      'USER',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 61, 111)),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
