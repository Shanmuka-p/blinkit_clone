import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  var cart = [
    {"img": "dairy.png", "text": "Amul Taaza Toned \nFresh Milk"},
    {"img": "vegetable.png", "text": "vegetables"},
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
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          children: [
            Image.asset("assets/images/shopping_cart.png"),
            Uihelper.CustomText(
              text: "Reordering will be easy",
              color: Colors.black,
              FontWeight: FontWeight.w800,
              fontsize: 20,
            ),
            SizedBox(height: 20),
            Uihelper.CustomText(
              text: "Items you order will show up here so you can buy",
              color: Colors.black,
              FontWeight: FontWeight.w500,
              fontsize: 10,
            ),
            Center(
              child: Uihelper.CustomText(
                text: "them again easily.",
                color: Colors.black,
                FontWeight: FontWeight.w500,
                fontsize: 10,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Uihelper.CustomText(
                text: "Bestsellers",
                color: Colors.black,
                FontWeight: FontWeight.w600,
                fontsize: 16,
                fontfamily: "bold",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 108,
                        width: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/dairy.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      Positioned(
                        left: 60,
                        bottom: -5,
                        child: SizedBox(
                          height: 28,
                          width: 40,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              //minimumSize: Size(1, 2),
                              padding: EdgeInsets.zero,
                              side: BorderSide(
                                color: Color(0XFF27AF34),
                                //width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Color(0XFF27AF34),
                                fontSize: 6,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Uihelper.CustomText(
                  //       text: "Amul Taaza Toned \nFresh Milk",
                  //       color: Colors.black,
                  //       FontWeight: FontWeight.w400,
                  //       fontsize: 8,
                  //     ),
                  //     Image.asset("assets/images/timer.png"),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 108,
                          width: 96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/vegetable.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        Positioned(
                          left: 60,
                          bottom: -5,
                          child: SizedBox(
                            height: 28,
                            width: 40,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                side: BorderSide(
                                  color: Color(0XFF27AF34),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Color(0XFF27AF34),
                                  fontSize: 6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 108,
                          width: 96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/tomato.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        Positioned(
                          left: 60,
                          bottom: -5,
                          child: SizedBox(
                            height: 28,
                            width: 40,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                side: BorderSide(
                                  color: Color(0XFF27AF34),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Color(0XFF27AF34),
                                  fontSize: 6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 150,
            //   child: Expanded(
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: cart.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           height: 108,
            //           width: 96,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(16),
            //             image: DecorationImage(
            //               image: AssetImage(
            //                 "assets/images/${cart[index]["img"]}",
            //               ),
            //               fit: BoxFit.contain,
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       automaticallyImplyLeading: false,
      //       backgroundColor: Colors.amberAccent,
      //       expandedHeight: 400,

      //       floating: true,
      //       pinned: true,
      //       actions: [
      //         Padding(
      //           padding: const EdgeInsets.only(right: 5),
      //           child: Container(
      //             height: 50,
      //             width: 49,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               color: Colors.white,
      //             ),
      //             child: Icon(Icons.person, color: Colors.black),
      //           ),
      //         ),
      //       ],
      //       title: Uihelper.CustomText(
      //         text: "Blinkit in\n16 minutes",
      //         color: Colors.black,
      //         FontWeight: FontWeight.w700,
      //         fontsize: 20,
      //       ),
      //       flexibleSpace: FlexibleSpaceBar(
      //         collapseMode: CollapseMode.pin,
      //         background: Image.asset(
      //           "assets/images/blinkit.jpg",
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildListDelegate([
      //         SizedBox(height: 10),
      //         Container(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Container(
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.horizontal(
      //                     left: Radius.circular(20),
      //                     right: Radius.circular(20),
      //                   ),
      //                 ),
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     prefixIcon: Icon(Icons.search),
      //                     prefixIconColor: Colors.black,
      //                     hintText: "Search “ice-cream”",
      //                     suffixIcon: Icon(Icons.mic),
      //                     suffixIconColor: Colors.black,
      //                   ),
      //                   // cursorRadius: Radius.circular(20),
      //                 ),
      //               ),
      //               Uihelper.CustomImage(
      //                 img: "shopping_cart.png",
      //                 height: 140,
      //                 width: 140,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ],
      // ),
    );
  }
}
