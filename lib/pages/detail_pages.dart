import 'dart:io';
import 'package:biodata/pages/home_pages.dart';
import 'package:flutter/material.dart';

class DetailPages extends StatelessWidget {
  DetailPages(
      {required this.imagesFile,
      required this.nama,
      required this.alamat,
      required this.email,
      required this.phone,
      required this.tanggalLahir});
  File imagesFile;
  String nama;
  String phone;
  String alamat;
  String email;
  String tanggalLahir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          'Detail Biodata $nama',
          style: const TextStyle(fontSize: 18),
        ),
        leading: const Icon(Icons.list),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Image.file(
                    imagesFile,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Nama Lengkap : $nama'),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Alamat : $alamat'),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Nomor Telepon : $phone'),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Email Address : $email'),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Tempat Tanggal Lahir : $tanggalLahir'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => HomePages())));
                  },
                  child: const Text('Home'))
            ],
          ),
        ),
      ),
    );
  }
}
