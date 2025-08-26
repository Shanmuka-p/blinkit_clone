import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Print extends StatefulWidget {
  const Print({super.key});

  @override
  State<Print> createState() => _PrintState();
}

class _PrintState extends State<Print> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: Color(0XFFF7CB45),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Uihelper.CustomText(
              text: "BlinkIt in",
              color: Colors.black,
              FontWeight: FontWeight.w700,
              fontsize: 12,
              fontfamily: "bold",
            ),
            Uihelper.CustomText(
              text: "16 minutes",
              color: Colors.black,
              FontWeight: FontWeight.w700,
              fontsize: 20,
              fontfamily: "bold",
            ),

            Row(
              children: [
                Uihelper.CustomText(
                  text: "HOME - ",
                  color: Colors.black,
                  FontWeight: FontWeight.bold,
                  fontsize: 12,
                  fontfamily: "bold",
                ),
                Uihelper.CustomText(
                  text: "Shanmuka Reddy, G.mamidada - ",
                  color: Colors.black,
                  FontWeight: FontWeight.w400,
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
            Uihelper.CustomText(
              text: "Print Store",
              color: Colors.black,
              FontWeight: FontWeight.w700,
              fontsize: 35,
            ),
            Uihelper.CustomText(
              text: "Blinkit ensures secure prints at every stage",
              color: Color(0XFF9C9C9C),
              FontWeight: FontWeight.w700,
              fontsize: 14,
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Image.asset("assets/images/print.png")],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Uihelper.CustomText(
                            text: "Documents",
                            color: Colors.black,
                            FontWeight: FontWeight.w700,
                            fontsize: 14,
                          ),

                          Uihelper.CustomText(
                            text: "✦ Price starting at rs 3/page",
                            color: Color(0XFF9C9C9C),
                            FontWeight: FontWeight.w400,
                            fontsize: 14,
                          ),
                          Uihelper.CustomText(
                            text: "✦ Paper quality: 70 GSM",
                            color: Color(0XFF9C9C9C),
                            FontWeight: FontWeight.w400,
                            fontsize: 14,
                          ),
                          Uihelper.CustomText(
                            text: "✦ Single side prints",
                            color: Color(0XFF9C9C9C),
                            FontWeight: FontWeight.w400,
                            fontsize: 14,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Color(0XFF27AF34),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Upload Files",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
