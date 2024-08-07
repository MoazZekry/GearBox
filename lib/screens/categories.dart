import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gearbox3/screens/product.dart';
import 'package:gearbox3/widgets/mediumcategories.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 248, 207, 0),
            width: double.infinity,
            height: MediaQuery.of(context).size.width / 4.5,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: const Center(
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.width / 2.7),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: GridView.count(
              mainAxisSpacing: MediaQuery.of(context).size.width / 30,
              crossAxisSpacing: MediaQuery.of(context).size.width / 30,
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 1.5,
              children: [
                MediumCategories(
                    context: context,
                    image: "images/oil.png",
                    title: "Oils & Lubes",
                    screen: ProductScreen()),
                MediumCategories(
                    context: context,
                    image: "images/brake.png",
                    title: "Brakes",
                    screen: ProductScreen()),
                MediumCategories(
                    context: context,
                    image: "images/tires.png",
                    title: "Tires",
                    screen: ProductScreen()),
                MediumCategories(
                    context: context,
                    image: "images/battery.png",
                    title: "Batteries",
                    screen: ProductScreen()),
                MediumCategories(
                    context: context,
                    image: "images/filters.png",
                    title: "Filters",
                    screen: ProductScreen()),
                MediumCategories(
                    context: context,
                    image: "images/gear.png",
                    title: "Gear & plugs",
                    screen: ProductScreen())
              ],
            ),
          )
        ],
      ),
    );
  }
}
