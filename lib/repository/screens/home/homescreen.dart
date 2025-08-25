import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var home = [
    {"img": "assets/images/light.png", "text": "Lights, Diyas \n& Candles"},
    {"img": "assets/images/gift.png", "text": "Diwali \nGifts"},
    {"img": "assets/images/gadgets.png", "text": "Appliances \n& Gadgets"},
    {"img": "assets/images/live.png", "text": "Home \n& Living"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: Color(0XFFEC0505),
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
                  text: "Shanmuka Reddy,G.mamidada - ",
                  color: Colors.black,
                  FontWeight: FontWeight.w400,
                  fontsize: 12,
                ),
                Image.asset("assets/images/arrow_down.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Icon(Icons.person, size: 35, color: Colors.white),
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
      body: Stack(
        alignment: AlignmentGeometry.topCenter,
        children: [
          Container(
            height: 196,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0XFFEC0505)),
          ),
          Positioned(
            top: 0,
            child: Row(
              children: [
                Image.asset("assets/images/home.png"),
                Image.asset("assets/images/home2.png"),
                Center(
                  child: Uihelper.CustomText(
                    text: "Mega Diwali Sale",
                    color: Colors.white,
                    FontWeight: FontWeight.w700,
                    fontsize: 20,
                    fontfamily: "bold",
                  ),
                ),
                Image.asset("assets/images/home2.png"),
                Image.asset("assets/images/home.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10),
            child: SizedBox(
              height: 208,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 108,
                          width: 86,
                          decoration: BoxDecoration(
                            color: Color(0XFFEAD3D3),
                            borderRadius: BorderRadius.circular(16),
                            //image: DecorationImage(image: AssetImage(home[index]["img"].toString(),),fit: BoxBorder.fromLTRB(bottom: BorderSide()))
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 10,
                          child: Uihelper.CustomText(
                            text: home[index]["text"].toString(),
                            color: Colors.black,
                            FontWeight: FontWeight.w600,
                            fontsize: 10,
                          ),
                        ),
                        Positioned(
                          bottom: 99,
                          child: Image.asset(home[index]["img"].toString()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
