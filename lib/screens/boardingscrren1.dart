import 'package:flutter/material.dart';
import 'package:gearbox3/screens/boardingscreen2.dart';

class BoardingScreenOne extends StatelessWidget {
  const BoardingScreenOne({super.key});

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
                    image: AssetImage("images/boardingscreen1.jpeg"),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color.fromARGB(164, 255, 255, 255),
                            size: 15,
                          )
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
                "Easy Shopping",
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
                  "Start purchasing your car’s spare partsonline by searching for your car model .",
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
                    builder: (context) => BoardingScreenTwo(),
                  ),
                );
              },
              child: Text(
                "Next",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Color.fromARGB(255, 248, 207, 0)),
            ),
          )
        ],
      ),
    );
  }
}
