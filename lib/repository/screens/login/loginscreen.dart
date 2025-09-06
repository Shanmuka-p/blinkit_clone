import 'package:blinkit_clone/repository/screens/bottomnav/saloman_bottom_bar.dart';
import 'package:blinkit_clone/repository/screens/login/number.dart';
import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.customImage(
            img: "Blinkit Onboarding Screen.png",
            height: 330.0,
            width: double.infinity,
          ),
          SizedBox(height: 10),
          Uihelper.customImage(
            img: "logo.png",
            height: 200.0,
            width: double.infinity,
          ),
          SizedBox(height: 20),
          Uihelper.customText(
            text: "India’s last minute app",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontsize: 20,
            fontfamily: "bold",
          ),
          SizedBox(height: 10),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Uihelper.customText(
                    text: "Shanmuka Reddy",
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontsize: 15,
                  ),
                  SizedBox(height: 10),
                  Uihelper.customText(
                    text: "628131XXXX",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontsize: 15,
                    fontfamily: "bold",
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 295,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SalomanBottomBar(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFE23744),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Uihelper.customText(
                            text: "Login  with",
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontsize: 14,
                          ),
                          SizedBox(width: 5),
                          Uihelper.customImage(
                            img: "zomato.png",
                            height: 40,
                            width: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Uihelper.customText(
                    text:
                        "Access your saved addresses from Zomato automatically!",
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontsize: 10,
                  ),
                  //SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Number()),
                      );
                    },
                    child: Text(
                      "or login with phone number",
                      style: TextStyle(
                        color: Color(0XFF269237),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  // Uihelper.customText(
                  //   text: "or login with phone number",
                  //   color: Color(0XFF269237),
                  //   fontWeight: FontWeight.w400,
                  //   fontsize: 17,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
