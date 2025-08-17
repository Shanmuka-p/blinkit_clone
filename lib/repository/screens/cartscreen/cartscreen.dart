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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amberAccent,
            expandedHeight: 400,

            floating: true,
            pinned: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  height: 50,
                  width: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ),
            ],
            title: Uihelper.CustomText(
              text: "Blinkit in\n16 minutes",
              color: Colors.black,
              FontWeight: FontWeight.w700,
              fontsize: 20,
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Image.asset(
                "assets/images/blinkit.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          hintText: "Search “ice-cream”",
                          suffixIcon: Icon(Icons.mic),
                          suffixIconColor: Colors.black,
                        ),
                        // cursorRadius: Radius.circular(20),
                      ),
                    ),
                    Uihelper.CustomImage(
                      img: "shopping_cart.png",
                      height: 140,
                      width: 140,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
