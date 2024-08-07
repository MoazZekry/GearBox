import 'package:flutter/material.dart';
import 'package:gearbox3/data/product/productclass.dart';
import 'package:gearbox3/screens/product.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  Product item;
  ProductDetails({
    super.key,
    required this.item,
  });
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 248, 207, 0),
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
                            builder: (context) => const ProductScreen(),
                          ),
                        );
                      },
                      child: const Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: const Center(
                      child: Text(
                        "Product Details",
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(7),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 248, 207, 0)),
                          color: const Color.fromARGB(255, 25, 25, 25),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset(widget.item.image)),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  fav = !fav;
                                });
                              },
                              child: fav == true
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Color.fromARGB(255, 255, 227, 89),
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Color.fromARGB(255, 255, 227, 89),
                                    )),
                        )
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.name,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          const Text(
                            "size - 17 inch",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          )
                        ],
                      ),
                      Text(
                        "${widget.item.price} \$",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 248, 207, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(
                    widget.item.discreption,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor:
                            const Color.fromARGB(255, 248, 207, 0)),
                    child: const Text(
                      "Order Now",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
