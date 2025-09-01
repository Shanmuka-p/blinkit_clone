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
      backgroundColor: Colors.white,
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Center(
      //         child: Uihelper.CustomText(
      //           text: "Enter Your Number",
      //           color: Colors.black,
      //           FontWeight: FontWeight.w700,
      //           fontsize: 20,
      //           fontfamily: "bold",
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Container(
      //           height: 50,
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.all(Radius.circular(16)),
      //           ),
      //           child: TextFormField(
      //             keyboardType: TextInputType.numberWithOptions(decimal: false),
      //             //textAlign: TextAlign.center,
      //             decoration: InputDecoration(
      //               //slabelText: "Enter the number",
      //               alignLabelWithHint: false,
      //               disabledBorder: InputBorder.none,
      //               focusedBorder: InputBorder.none,
      //               enabledBorder: InputBorder.none,
      //               hintText: "Enter the number",
      //               hintTextDirection: TextDirection.ltr,
      //             ),
      //             style: TextStyle(color: Colors.black),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              // Center(child: Image.asset("assets/images/blinkit.jpg")),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                //height: 300,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/blinkit.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
