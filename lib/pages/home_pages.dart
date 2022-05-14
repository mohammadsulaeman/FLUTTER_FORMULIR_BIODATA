import 'dart:io';
import 'package:biodata/pages/detail_pages.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);
  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  File? imageFile;
  ImagePicker picker = ImagePicker();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ttlController = TextEditingController();
  Future openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('choose image Camera Not Selected')));
      }
    });
  }

  Future openGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('choose image Gallery Not Selected')));
      }
    });
  }

  @override
  void dispose() {
    namaController.dispose();
    phoneController.dispose();
    alamatController.dispose();
    emailController.dispose();
    ttlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Biodata Diri'),
        centerTitle: true,
        leading: const Icon(Icons.home),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            imageFile != null
                ? ClipOval(
                    child: Image.file(
                      imageFile!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('images/user.png'),
                    ),
                  ),
            const Text(
              'Choose Image',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Positioned(
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: ((builder) => Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Choose Photo',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: openGallery,
                                          child: const Text('Gallery'),
                                        ),
                                        ElevatedButton(
                                            onPressed: openCamera,
                                            child: const Text('Camera'))
                                      ],
                                    )
                                  ],
                                ),
                              )));
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Nama Lengkap',
                    hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: OutlineInputBorder(),
                    labelText: 'Nama Lengkap'),
                controller: namaController,
                keyboardType: TextInputType.name,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Alamat Sesuai KTP',
                    labelText: 'Alamat Sesuai KTP',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder()),
                controller: alamatController,
                keyboardType: TextInputType.name,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Nomor Telepon',
                    labelText: 'Nomor Telepon',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder()),
                controller: phoneController,
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Email Address',
                    labelText: 'Email Address',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder()),
                controller: emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Tempat, Tanggal Lahir',
                    labelText: 'Tempat, Tanggal Lahir',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder()),
                controller: ttlController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => DetailPages(
                        imagesFile: imageFile!,
                        nama: namaController.text,
                        alamat: alamatController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        tanggalLahir: ttlController.text))));
              },
              child: const Text(
                'Cetak Detail',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
