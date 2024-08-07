import 'package:flutter/material.dart';
import 'package:gearbox3/data/product/products.dart';
import 'package:gearbox3/screens/homescreenbase.dart';
import 'package:gearbox3/screens/productdetails.dart';
import 'package:gearbox3/widgets/productitem.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreenBase(),
                          ),
                        );
                      },
                      child: const Icon(Icons.arrow_back_ios)),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: const Center(
                      child: Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.width / 4.5),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ListView(
                children: [
                  ProductItem(
                    item: productItems[0]!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  ProductItem(
                    item: productItems[1]!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(item: productItems[2]!),
                        ),
                      );
                    },
                    child: ProductItem(
                      item: productItems[2]!,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  ProductItem(
                    item: productItems[3]!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  ProductItem(
                    item: productItems[4]!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  ProductItem(
                    item: productItems[5]!,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
