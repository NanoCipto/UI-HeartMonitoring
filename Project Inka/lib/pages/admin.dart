import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'dart:convert'; // Untuk jsonEncode dan jsonDecode
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart'; // untuk DateFormat

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
        backgroundColor: Colors.orange,
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
                //Button Admin
                Positioned(
                  top: parentHeight * 0.54,
                  left: parentWidth * 0.38,
                  right: parentWidth * 0.38,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Back ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4, // Nilai elevasi untuk menambahkan bayangan
                      shadowColor: Colors.black, // Warna bayangan (opsional)
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
                    bottom: parentHeight * 0.265,
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
                    bottom: parentHeight * 0.18,
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

class ReportPages extends StatefulWidget {
  const ReportPages({super.key});

  @override
  State<ReportPages> createState() => _ReportPagesState();
}

class _ReportPagesState extends State<ReportPages> {
  Map<String, dynamic> firebaseData = {};
  bool isLoading = true;

  // Fungsi untuk mengambil data dari Firebase
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    // DateTime waktuaktual = DateTime.now();
    String url =
        "https://heartratemonitoring-c0e5d-default-rtdb.firebaseio.com/data.json"; // Mengambil semua data di bawah "data"

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          firebaseData = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  // Fungsi untuk menampilkan data dalam bentuk Card dengan Detail Navigation
  Widget buildDataWidget() {
    if (firebaseData.isEmpty) {
      return Text("No data found");
    }

    // Membuat daftar Card untuk setiap entri data
    return ListView(
      children: firebaseData.entries.expand<Widget>((dateEntry) {
        final timeEntries = dateEntry.value as Map<String, dynamic>;

        // Iterasi di setiap entri waktu
        return timeEntries.entries.map<Widget>((timeEntry) {
          final details = timeEntry.value as Map<String, dynamic>;

          // Mendapatkan hasil yang tidak termasuk 'Nama' dan 'Divisi'
          final hasil = details.entries
              .where((entry) => entry.key != 'Nama' && entry.key != 'Divisi')
              .map((entry) => "${entry.key}: ${entry.value}")
              .join(', ');

          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman DetailPage dengan membawa data Nama, Divisi, dan Hasil
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    nama: details['Nama'] ?? '-',
                    divisi: details['Divisi'] ?? '-',
                    hasil: hasil,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 4.0, // menambahkan shadow pada card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Meratakan isi card ke kiri
                  children: [
                    // Section Nama (rata kiri)
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Rata kiri pada teks
                      children: [
                        Text(
                          'Nama:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8), // Spasi antar teks
                        Expanded(
                          child: Text(details['Nama'] ?? '-'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Spasi antara section

                    // Section Divisi (rata kiri)
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Rata kiri pada teks
                      children: [
                        Text(
                          'Divisi:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8), // Spasi antar teks
                        Expanded(
                          child: Text(details['Divisi'] ?? '-'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Spasi antara section

                    // Section Detail (klik untuk melihat detail data)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8), // Spasi antar teks
                        Expanded(
                          child: Text(
                            'Klik untuk detail', // Menampilkan teks "Klik untuk detail"
                            style: TextStyle(
                                color: Colors.blue), // Warna biru untuk link
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList();
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 3, 3),
        title: Center(
          child: Text(
            'DATA HASIL',
            style: TextStyle(
              color: Colors.white,
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
        actions: [
          Padding(
            //Logo Quesioner
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset(
                'assets/icons/QUIZ.svg',
              ),
            ),
          )
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        // final parentWidth = constraints.maxWidth;
        // final parentHeight = constraints.maxHeight;

        return Stack(
          children: [
            // Background SVG yang responsif
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/icons/background_4.svg',
                fit: BoxFit.cover, // Agar gambar menyesuaikan dengan layar
              ),
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child:
                        buildDataWidget(), // Ini adalah widget utama yang Anda ingin tampilkan
                  ),
          ],
        );
      }),
    );
  }
}

// Halaman baru untuk menampilkan detail berdasarkan data yang dipilih
class DetailPage extends StatelessWidget {
  final String nama;
  final String divisi;
  final String hasil;

  // Constructor untuk menerima parameter Nama, Divisi, dan Hasil
  DetailPage({required this.nama, required this.divisi, required this.hasil});

  // Fungsi untuk memisahkan hasil menjadi beberapa bagian
  Widget buildResultDetail(String hasil) {
    // Memisahkan hasil berdasarkan koma
    List<String> resultParts = hasil.split(', ');

    // Mendapatkan bagian Amo, BPM List, Modus, MxDMn, RR Interval, dan Stress Index
    String amo = resultParts.firstWhere((part) => part.startsWith('Amo'),
        orElse: () => 'Amo: -');
    String bpmList = resultParts.firstWhere(
        (part) => part.startsWith('BPM List'),
        orElse: () => 'BPM List: -');
    String modus = resultParts.firstWhere((part) => part.startsWith('Modus'),
        orElse: () => 'Modus: -');
    String mxDMn = resultParts.firstWhere((part) => part.startsWith('MxDMn'),
        orElse: () => 'MxDMn: -');
    String rrInterval = resultParts.firstWhere(
        (part) => part.startsWith('RRInterval'),
        orElse: () => 'RRInterval: -');
    String stressIndex = resultParts.firstWhere(
        (part) => part.startsWith('StresIndex'),
        orElse: () => 'StressIndex: -');
    String quesionerSkor = resultParts.firstWhere(
        (part) => part.startsWith('Quesioner Skor'),
        orElse: () => 'Quesioner Skor: -');
    String stressCategory = resultParts.firstWhere(
        (part) => part.startsWith('Stress Category'),
        orElse: () => 'Stress Category: -');

    // Menampilkan data dengan jarak antar elemen
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(amo, style: TextStyle(fontSize: 16)), // Amo tanpa bold
        SizedBox(height: 8),
        // Menampilkan BPM List secara penuh
        Text(
          bpmList,
          style: TextStyle(fontSize: 16),
          softWrap:
              true, // Membuat teks bisa membungkus baris jika terlalu panjang
        ),
        SizedBox(height: 8),
        Text(modus, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Text(mxDMn, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        // Menampilkan RRInterval secara penuh
        Text(
          rrInterval,
          style: TextStyle(fontSize: 16),
          softWrap:
              true, // Membuat teks bisa membungkus baris jika terlalu panjang
        ),
        SizedBox(height: 8),
        Text(stressIndex, style: TextStyle(fontSize: 16)),

        // Menampilkan Quesioner Skor
        Text(quesionerSkor,
            style: TextStyle(fontSize: 16)), // Menampilkan skor tanpa bold
        SizedBox(height: 8),

        // Menampilkan Stress Category
        Text(stressCategory,
            style: TextStyle(fontSize: 16)), // Menampilkan kategori tanpa bold
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 241, 3, 3),
          title: Center(
            child: Text(
              'DETAIL HASIL',
              style: TextStyle(
                color: Colors.white,
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
          actions: [
            Padding(
              //Logo Quesioner
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 40,
                height: 40,
                child: SvgPicture.asset(
                  'assets/icons/QUIZ.svg',
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            // Positioned.fill(
            //   child: SvgPicture.asset(
            //     'assets/icons/background_4.svg',
            //     fit: BoxFit.cover, // Agar gambar menyesuaikan dengan layar
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tampilkan Nama
                  Text(
                    'Nama:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(nama),
                  SizedBox(height: 16),

                  // Tampilkan Divisi
                  Text(
                    'Divisi:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(divisi),
                  SizedBox(height: 16),

                  // Tampilkan Hasil dengan format yang lebih rapi
                  Text(
                    'Hasil:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  buildResultDetail(hasil), // Fungsi yang memisahkan hasil
                ],
              ),
            ),
          ],
        ));
  }
}
