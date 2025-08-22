import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
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
