import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  var Grocery = [
    {"img": "veg.png", "text": "Vegetables & \nFruits"},
    {"img": "atta.png", "text": "Atta, Dal & \nRice"},
    {"img": "oil.png", "text": "Oil, Ghee & \nMasala"},
    {"img": "milk.png", "text": "Dairy, Bread & \nMilk"},
    {"img": "bis.png", "text": "Biscuits &  \nBakery"},
  ];
  var second = [
    {"img": "snack.png", "text": "Dry Fruits & \nCereals"},
    {"img": "kitchen.png", "text": "Kitchen & \nAppliances"},
    {"img": "tea.png", "text": "Tea & \nCoffees"},
    {"img": "ice.png", "text": "Ice Creams & \nmuch more"},
    {"img": "noodles.png", "text": "Noodles & \nPacket Food"},
  ];
  var third = [
    {"img": "chips.png", "text": "Chips & \nNamkeens"},
    {"img": "sweets.png", "text": "Sweets & \nChocalates"},
    {"img": "drink.png", "text": "Drinks & \nJuices"},
    {"img": "sos.png", "text": "Sauces & \nSpreads"},
    {"img": "beauty.png", "text": "Beauty & \nCosmetics"},
  ];
  var four = [
    {"img": "house1.png", "text": "SurfExcel & \nhome"},
    {"img": "house2.png", "text": "Soaps & \nhome"},
    {"img": "house3.png", "text": "Sound bar & \nhome"},
    {"img": "house4.png", "text": "Soaps & \nhome"},
    {"img": "house5.png", "text": "Hair oil & \nhome"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: 10),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Uihelper.CustomText(
                    text: "Grocery & Kitchen",
                    color: Colors.black,
                    FontWeight: FontWeight.w700,
                    fontsize: 14,
                    fontfamily: "bold",
                  ),
                ],
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (contex, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 78,
                            width: 71,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFD9EBEB),
                            ),
                            child: Uihelper.CustomImage(
                              img: Grocery[index]["img"].toString(),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Uihelper.CustomText(
                          text: Grocery[index]["text"].toString(),
                          color: Colors.black,
                          FontWeight: FontWeight.w400,
                          fontsize: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: Grocery.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            //SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (contex, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 78,
                            width: 71,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFD9EBEB),
                            ),
                            child: Uihelper.CustomImage(
                              img: second[index]["img"].toString(),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Uihelper.CustomText(
                          text: second[index]["text"].toString(),
                          color: Colors.black,
                          FontWeight: FontWeight.w400,
                          fontsize: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: second.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Uihelper.CustomText(
                    text: "Snacks & Drinks",
                    color: Colors.black,
                    FontWeight: FontWeight.w700,
                    fontsize: 14,
                    fontfamily: "bold",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (contex, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 78,
                            width: 71,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFD9EBEB),
                            ),
                            child: Uihelper.CustomImage(
                              img: third[index]["img"].toString(),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Uihelper.CustomText(
                          text: third[index]["text"].toString(),
                          color: Colors.black,
                          FontWeight: FontWeight.w400,
                          fontsize: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: third.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Uihelper.CustomText(
                    text: "Household Essentials",
                    color: Colors.black,
                    FontWeight: FontWeight.w700,
                    fontsize: 14,
                    fontfamily: "bold",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (contex, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 78,
                            width: 71,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFD9EBEB),
                            ),
                            child: Uihelper.CustomImage(
                              img: four[index]["img"].toString(),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Uihelper.CustomText(
                          text: four[index]["text"].toString(),
                          color: Colors.black,
                          FontWeight: FontWeight.w400,
                          fontsize: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: four.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
