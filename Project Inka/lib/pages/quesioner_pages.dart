// import 'package:fitness/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class QuesionerPages extends StatefulWidget {
  final Map<String, dynamic> collectedData;
  QuesionerPages({required this.collectedData});

  @override
  State<QuesionerPages> createState() => _QuesionerPagesState();
}

class _QuesionerPagesState extends State<QuesionerPages> {
  List<int> selectedValues = List.filled(14, 0);

  void PerhitunganData() {
    int totalScore = selectedValues.reduce((a, b) => a + b);
    String resultCategory = calculateScoreCategory(totalScore);

    Map<String, dynamic> updatedCollectedData = Map.from(widget.collectedData);
    updatedCollectedData['Quesioner Skor'] = totalScore;
    updatedCollectedData['Stress Category'] = resultCategory;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          totalScore: totalScore,
          resultCategory: resultCategory,
          collectedData: updatedCollectedData,
        ),
      ),
    );
  }

  // List Pertanyaan
  final List<String> questions = [
    'Menjadi marah karena hal-hal kecil/sepele',
    'Cenderung bereaksi berlebihan terhadap suatu situasi',
    'Kesulitan untuk berelaksasi/santai',
    'Mudah merasa kesal',
    'Merasa banyak menghasilkan energi karena cemas',
    'Tidak sabaran',
    'Mudah tersinggung',
    'Sulit untuk beristirahat',
    'Mudah marah',
    'Kesulitan untuk tenang setelah sesuatu yang mengganggu',
    'Sulit untuk mentoleransi gangguan-gangguan terhadap hal-hal yang dilakukan',
    'Berada pada keadaan tegang',
    'Tidak dapat memaklumi hal apapun yang menghalangi untuk menyelesaikan hal yang sedang dilakukan',
    'Mudah gelisah',
  ];

  // Fungsi Perhitungan Skor dan Penentuan Kategori Stress
  String calculateScoreCategory(int totalScore) {
    int totalScore = selectedValues.reduce((a, b) => a + b);
    if (totalScore < 15) {
      return 'Pekerja tidak mengalami stress';
    } else if (totalScore < 19) {
      return 'Pekerja mengalami stress dengan kategori ringan';
    } else if (totalScore < 26) {
      return 'Pekerja mengalami stress dengan kategori sedang';
    } else if (totalScore < 34) {
      return 'Pekerja mengalami stress dengan kategori berat';
    } else {
      return 'Pekerja mengalami stress dengan kategori sangat berat';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 3, 3),
        title: Center(
          child: Text(
            'Quesioner',
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
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/icons/background_4.svg',
              fit: BoxFit.cover, // Agar gambar menyesuaikan dengan layar
            ),
          ),
          ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}.${questions[index]}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (i) {
                            return Row(
                              children: [
                                Radio<int>(
                                  value: i,
                                  groupValue: selectedValues[index],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValues[index] = value!;
                                    });
                                  },
                                ),
                                Text('$i'),
                              ],
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigasi
          PerhitunganData();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int totalScore;
  final String resultCategory;
  final Map<String, dynamic> collectedData;

  ResultPage(
      {required this.totalScore,
      required this.resultCategory,
      required this.collectedData});

  void showCollectedDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Collected Data'),
        content: SingleChildScrollView(
          child: ListBody(
            children: collectedData.entries
                .map((entry) => Text('${entry.key}: ${entry.value.toString()}'))
                .toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void SubmitAndUploadData(BuildContext context) {
    //Upload Firebase
    DateTime waktuaktual = DateTime.now();
    String url =
        "https://heartratemonitoring-c0e5d-default-rtdb.firebaseio.com/data/${DateFormat('yyyy-MM-dd').format(waktuaktual)}/${DateFormat('HH-mm-ss').format(waktuaktual)}.json";
    http
        .patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(collectedData),
    )
        .then((response) {
      String message;
      if (response.statusCode == 200) {
        message = 'Data uploaded successfully';
      } else {
        message = 'Failed to upload data. Status code: ${response.statusCode}';
      }

      // Display pop-up dialog with status message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Upload Status'),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      // Handle network error or other exceptions
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $error'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      print('Error occurred: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 3, 3),
        title: Center(
          child: Text(
            'Hasil Penilaian Stress',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final parentWidth = constraints.maxWidth;
          final parentHeight = constraints.maxHeight;
          return Stack(children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/icons/background_3.svg',
                fit: BoxFit.cover, // Agar gambar menyesuaikan dengan layar
              ),
            ),
            Positioned(
              top: parentHeight * 0.3,
              left: parentWidth * 0.3,
              right: parentWidth * 0.3,
              child: Text(
                'Skor Total: $totalScore',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: parentHeight * 0.56,
              left: parentWidth * 0.1,
              right: parentWidth * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol Back ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Warna latar tombol
                  foregroundColor: Colors.black, // Warna teks tombol
                  elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                  shadowColor: Colors.black, // Warna bayangan (opsional)
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 0.5), // Ukuran padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0), // Border persegi dengan sudut melengkung
                  ),
                ),
                child: Text(
                  resultCategory,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: parentHeight * 0.35,
              left: parentWidth * 0.22,
              right: parentWidth * 0.22,
              child: ElevatedButton(
                onPressed: () {
                  // Tampilkan data collectedData sebelum dikirim ke Firebase
                  showCollectedDataDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Warna tombol
                  elevation: 6, // Nilai elevasi untuk menambahkan bayangan
                  shadowColor: Colors.black, // Warna bayangan (opsional)
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'CEK DATA',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: parentHeight * 0.2,
              left: parentWidth * 0.22,
              right: parentWidth * 0.22,
              child: ElevatedButton(
                onPressed: () {
                  SubmitAndUploadData(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => UserPage()));
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
                  'SIMPAN KE DATABASE',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 61, 111)),
                ),
              ),
            ),
            Positioned(
              bottom: parentHeight * 0.13,
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
                ),
                child: Text(
                  'KEMBALI',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 61, 111)),
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
