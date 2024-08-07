import 'package:flutter/material.dart';
import 'package:gearbox3/screens/boardingscrren1.dart';
import 'package:gearbox3/screens/login.dart';

class BoardingScreenTwo extends StatelessWidget {
  const BoardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    opacity: 0.7,
                    image: AssetImage("images/boardingscreen2.jpeg"),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BoardingScreenOne(),
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Color.fromARGB(164, 255, 255, 255),
                            size: 15,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Secure Payment",
                style: TextStyle(
                    color: Color.fromARGB(164, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Enjoy purchasing your spare parts with secure payment.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(164, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 12,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Color.fromARGB(255, 248, 207, 0)),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }
}
