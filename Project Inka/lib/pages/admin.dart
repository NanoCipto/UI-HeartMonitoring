import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // Controller TextField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Daftar Username dan Password
  final List<Map<String, String>> _users = [
    {'username': 'user1', 'password': 'pass1'},
    {'username': 'user2', 'password': 'pass2'},
    {'username': 'admin', 'password': 'admin123'},
  ];

  //Fungsi Untuk Memeriksa Username dan Password
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    bool isValidUser = _users.any(
      (user) => user['username'] == username && user['password'] == password,
    );

    if (isValidUser) {
      // Case Berhasil --> Message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Login Berhasil!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ));
      
      // Navigasi
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReportPages()));
    } else {
      // Case Gagal
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Username atau Password salah!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ));
    }
    // Menghapus Isi Teks
    _usernameController.clear();
    _passwordController.clear();
  }

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
                //Button Admin
                Positioned(
                  top: parentHeight * 0.45,
                  left: parentWidth * 0.38,
                  right: parentWidth * 0.38,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Back ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Warna latar tombol
                      foregroundColor: Colors.black, // Warna teks tombol
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0.5), // Ukuran padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Border persegi dengan sudut melengkung
                      ),
                    ),
                    child: Text(
                      'ADMIN',
                      style: TextStyle(
                          fontSize: 18,
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
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
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
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
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
                      _login();
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

class ReportPages extends StatelessWidget {
  const ReportPages({super.key});

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
          title: Center(
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
                      15), // Border persegi dengan sudut melengkung
                ),
              ),
              child: Text(
                'DATA HASIL',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0)),
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
          ],
        ));
  }
}
