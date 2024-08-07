import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
                      onTap: () {}, child: const Icon(Icons.arrow_back_ios)),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: const Center(
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
