import 'package:blinkit_clone/domain/constants/appcolors.dart';
import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.Scaffoldbackground,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Uihelper.CustomText(
                text: "Enter Your Number",
                color: Colors.black,
                FontWeight: FontWeight.w700,
                fontsize: 20,
                fontfamily: "bold",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: TextFormField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    //slabelText: "Enter the number",
                    alignLabelWithHint: false,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Enter the number",
                    hintTextDirection: TextDirection.ltr,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
