import 'dart:io';

import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Print extends StatefulWidget {
  const Print({super.key});

  @override
  State<Print> createState() => _PrintState();
}

class _PrintState extends State<Print> {
  File? _selectedImage;

  Future<void> _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImage != null) {
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: Color(0XFFF7CB45),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Uihelper.customText(
              text: "BlinkIt in",
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontsize: 12,
              fontfamily: "bold",
            ),
            Uihelper.customText(
              text: "16 minutes",
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontsize: 20,
              fontfamily: "bold",
            ),

            Row(
              children: [
                Uihelper.customText(
                  text: "HOME - ",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontsize: 12,
                  fontfamily: "bold",
                ),
                Uihelper.customText(
                  text: "Shanmuka Reddy, G.mamidada - ",
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontsize: 12,
                ),
                Image.asset("assets/images/arrow_down.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.person, size: 35),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10),
                      right: Radius.circular(10),
                    ),
                  ),
                  prefixIcon: Image.asset(
                    "assets/images/search.png",
                    color: Colors.black,
                  ),
                  hintText: "Search “ice-cream”",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "bold",
                  ),
                  suffixIcon: Image.asset(
                    "assets/images/mic.png",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 40),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Uihelper.customText(
              text: "Print Store",
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontsize: 35,
            ),
            Uihelper.customText(
              text: "Blinkit ensures secure prints at every stage",
              color: Color(0XFF9C9C9C),
              fontWeight: FontWeight.w700,
              fontsize: 14,
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.amber[100]),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //SizedBox(height: 20),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //SizedBox(height: 20),
                          Image.asset("assets/images/print.png"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Uihelper.customText(
                            text: "Documents",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontsize: 14,
                          ),
                          SizedBox(height: 10),
                          Uihelper.customText(
                            text: "✦ Price starting at rs 3/page",
                            color: Color(0XFF9C9C9C),
                            fontWeight: FontWeight.w400,
                            fontsize: 14,
                          ),
                          Uihelper.customText(
                            text: "✦ Paper quality: 70 GSM",
                            color: Color(0XFF9C9C9C),
                            fontWeight: FontWeight.w400,
                            fontsize: 14,
                          ),
                          Uihelper.customText(
                            text: "✦ Single side prints",
                            color: Color(0XFF9C9C9C),
                            fontWeight: FontWeight.w400,
                            fontsize: 14,
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Color(0XFF27AF34),
                              ),
                            ),
                            onPressed: _pickImageFromGallery,
                            child: Text(
                              "Upload Files",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          //SizedBox(height: 10),
                          _selectedImage != null
                              ? Image.file(_selectedImage!)
                              : Text("Please Select the image"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
