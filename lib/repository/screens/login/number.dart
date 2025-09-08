import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  // TextEditingController countrycode = TextEditingController();
  // @override
  // void initState() {
  //   countrycode.text = "+91";

  //   super.initState();
  // }

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
      //         child: Uihelper.customText(
      //           text: "Enter Your Number",
      //           color: Colors.black,
      //           fontWeight: FontWeight.w700,
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 500,
            child: Container(
              //height: 300,
              //width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/blinkit.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 500,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Uihelper.customText(
                        text: "Login",
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontsize: 25,
                        fontfamily: "bold",
                      ),
                    ),
                    SizedBox(height: 30),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      languageCode: 'en',
                      // dropdownDecoration: BoxDecoration(
                      //   color: Colors.amber,
                      //   shape: BoxShape.rectangle,
                      // ),
                      invalidMessage: "Invalid Phone number",
                      keyboardType: TextInputType.phone,
                      //enabled: false,
                      //style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/otp');
                        },
                        child: Text(
                          "Send Otp",
                          selectionColor: Colors.amber,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("OR"),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/google.jpeg",
                              ),
                              radius: 15,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Sign in with Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
