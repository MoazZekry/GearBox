import 'package:flutter/material.dart';

Widget MediumCategories(
    {required String title,
    required String image,
    required BuildContext context,
    required Widget screen}) {
  return InkWell(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.all(7),
      width: MediaQuery.of(context).size.height / 7,
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromARGB(255, 248, 207, 0)),
          color: Color.fromARGB(255, 36, 36, 36),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 7.9,
                width: MediaQuery.of(context).size.height / 4,
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
    ),
  );
}
