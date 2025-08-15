import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(img: "Blinkit Onboarding Screen.png"),
            SizedBox(height: 10),
            Uihelper.CustomImage(img: "logo.png"),
            SizedBox(height: 10),
            Uihelper.CustomText(
              text: "India’s last minute app",
              color: Colors.black,
              FontWeight: FontWeight.bold,
              fontsize: 20,
              fontfamily: "bold",
            ),
          ],
        ),
      ),
    );
  }
}
