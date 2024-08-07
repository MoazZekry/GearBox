import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gearbox3/widgets/smallcategories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_on_outlined),
                        hintText: 'Delivering Location',
                        filled: true,
                        fillColor: Color.fromARGB(255, 36, 36, 36),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(59, 181, 189, 153),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    size: 30,
                    Icons.notifications_active,
                    color: Color.fromARGB(255, 255, 230, 105),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  aspectRatio: 2.0,
                ),
                items: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 36, 36, 36),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 100, child: Image.asset("images/oil.png")),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Buy Now !",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(
                                  "& Get sale",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "50%",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 248, 207, 0),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30),
                                ),
                              ],
                            ),
                            Text(
                              "on all Oils products",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                          ],
                        )
                      ],
                    )),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              const Text(
                "Categories",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SmallCategories(
                        title: "Oils & Lubes",
                        image: "images/oil.png",
                        context: context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    SmallCategories(
                        title: "Brakes",
                        image: "images/brake.png",
                        context: context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    SmallCategories(
                        title: "Tires",
                        image: "images/tires.png",
                        context: context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    SmallCategories(
                        title: "Filters",
                        image: "images/filters.png",
                        context: context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    SmallCategories(
                        title: "Battery",
                        image: "images/battery.png",
                        context: context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    SmallCategories(
                        title: "Gears",
                        image: "images/gear.png",
                        context: context),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              const Text(
                "Find Car Parts",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                  hintText: 'Car Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Model',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Year of Made',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 55,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Engine Capacity',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 248, 207, 0)),
                child: const Text(
                  "Find part",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
