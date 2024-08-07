import 'package:flutter/material.dart';
import 'package:gearbox3/screens/product.dart';

Widget SmallCategories(
    {required String title,
    required String image,
    required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductScreen(),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.all(7),
      width: MediaQuery.of(context).size.height / 6,
      height: MediaQuery.of(context).size.height / 6,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 36, 36, 36),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 10.9,
              width: MediaQuery.of(context).size.height / 8,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              )),
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
