import 'package:flutter/material.dart';
import 'package:gearbox3/data/global.dart';
import 'package:gearbox3/screens/homescreenbase.dart';

class PaymentStats extends StatelessWidget {
  const PaymentStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Text(
                "your payment has been successful",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Icon(
                Icons.check_box,
                color: const Color.fromARGB(255, 248, 207, 0),
                size: 100,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              ElevatedButton(
                onPressed: () {
                  screenIndex = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreenBase(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 248, 207, 0)),
                child: const Text(
                  "Go Home",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ));
  }
}
