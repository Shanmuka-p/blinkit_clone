import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:blinkit_clone/domain/providers/cart_provider.dart';
import 'package:blinkit_clone/domain/models/product_model.dart';
import 'package:blinkit_clone/repository/screens/cartscreen/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  var home1 = [
    {"img": "deep.png", "text": "Golden Glass \nWooden Lid Candle"},
    {"img": "home_sweets.png", "text": "Royal Gulab Jamun \nBy Bikano"},
    {"img": "banner.png", "text": "Bikaji Bhujia"},
  ];
  var grocery = [
    {"img": "veg.png", "text": "Vegetables & \nFruits"},
    {"img": "atta.png", "text": "Atta, Dal & \nRice"},
    {"img": "oil.png", "text": "Oil, Ghee & \nMasala"},
    {"img": "milk.png", "text": "Dairy, Bread & \nMilk"},
    {"img": "bis.png", "text": "Biscuits &  \nBakery"},
  ];

  Widget _buildAddButton(BuildContext context, String imagePath) {
    final filename = imagePath.split('/').last;
    final product = mockProducts.firstWhere(
      (p) => p.image == filename,
      orElse: () => mockProducts.first,
    );

    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        final qty = cart.getProductQuantity(product.id);
        if (qty > 0) {
          return Container(
            height: 28,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0XFF27AF34),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => cart.removeFromCart(product),
                  child: const Icon(Icons.remove, color: Colors.white, size: 14),
                ),
                Text(
                  qty.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                GestureDetector(
                  onTap: () => cart.addToCart(product),
                  child: const Icon(Icons.add, color: Colors.white, size: 14),
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            height: 28,
            width: 60,
            child: OutlinedButton(
              onPressed: () => cart.addToCart(product),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                side: const BorderSide(
                  color: Color(0XFF27AF34),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                "ADD",
                style: TextStyle(
                  color: Color(0XFF27AF34),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }

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
            Uihelper.customText(
              text: "BlinkIt in",
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontsize: 12,
              fontfamily: "bold",
            ),
            Uihelper.customText(
              text: "16 minutes",
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontsize: 20,
              fontfamily: "bold",
            ),

            Row(
              children: [
                Uihelper.customText(
                  text: "HOME - ",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontsize: 12,
                  fontfamily: "bold",
                ),
                Uihelper.customText(
                  text: "Shanmuka Reddy,G.mamidada - ",
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
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
            height: 176,
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
                  child: Uihelper.customText(
                    text: "Mega Diwali Sale",
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
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
            padding: const EdgeInsets.only(top: 55.0, left: 10),
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
                          child: Uihelper.customText(
                            text: home[index]["text"].toString(),
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
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
          //SizedBox(width: 20),
          ListView.builder(
            itemCount: 3,
            //shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 108,
                              width: 93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                //color: Colors.amber,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/${home1[index]["img"]}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 50,
                          bottom: 210,
                          child: _buildAddButton(context, home1[index]["img"].toString()),
                        ),
                       // SizedBox(height: 10),
                        Positioned(
                          left: 10,
                          bottom: 185,
                          child: Uihelper.customText(
                            text: home1[index]["text"].toString(),
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontsize: 8,
                            fontfamily: "bold",
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 155,
                          child: Uihelper.customText(
                            text: "₹ 79",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontsize: 15,
                            fontfamily: "bold",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            left: 20,
            bottom: 140,
            child: Uihelper.customText(
              text: "Grocery & Kitchen",
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontsize: 14,
              fontfamily: "bold",
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20,
                    ),
                    child: Container(
                      height: 78,
                      width: 71,
                      decoration: BoxDecoration(
                        color: Color(0XFFD9EBEB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Uihelper.customImage(
                        img: grocery[index]["img"].toString(),
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Uihelper.customText(
                    text: grocery[index]["text"].toString(),
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontsize: 10,
                  ),
                ],
              );
            },
          ),
          // Dynamic Floating Cart Banner (Sticky Bottom)
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              if (cart.totalItemsCount == 0) return const SizedBox.shrink();
              return Positioned(
                bottom: 15,
                left: 15,
                right: 15,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0XFF0C831F), // Blinkit brand green
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 24),
                          const SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${cart.totalItemsCount} ITEM${cart.totalItemsCount > 1 ? 'S' : ''}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                "₹${cart.grandTotal.toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Cartscreen()),
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              "View Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
