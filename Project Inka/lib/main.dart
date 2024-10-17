import 'package:fitness/core.dart';
import 'package:fitness/pages/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<void> requestStoragePermission() async {
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    } else if (status.isDenied) {
      // Izin ditolak, tampilkan dialog untuk meminta izin
      await Permission.manageExternalStorage.request();
    } else if (status.isPermanentlyDenied) {
      // Izin ditolak secara permanen, arahkan pengguna ke pengaturan
      await openAppSettings();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const MainMenu(),
    );
  }
}
