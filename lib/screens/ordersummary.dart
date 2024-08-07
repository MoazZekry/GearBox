import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/event.dart';
import 'package:gearbox3/data/product/products.dart';
import 'package:gearbox3/screens/homescreenbase.dart';
import 'package:gearbox3/screens/paymentstats.dart';
import 'package:gearbox3/widgets/ordersummary.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  bool visa = false;
  bool master = false;
  bool cash = true;

  @override
  Widget build(BuildContext context) {
    int total = 0;

    return BlocBuilder<CartBloc, AuthenticationState>(
      builder: (context, state) {
        state.cart.forEach((key, value) {
          total += productItems[key]!.price * value;
        });
        final mapEntries = state.cart.entries.toList();
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  builder: (context) => const HomeScreenBase(),
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: const Center(
                            child: Text(
                              "Order Summary",
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
                    padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Order Summary",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 2 / 5,
                            child: ListView.builder(
                              itemCount: state.cart.length,
                              itemBuilder: (context, index) {
                                final mapEntry = mapEntries[index];
                                return SummaryItem(
                                    item: productItems[mapEntry.key]!);
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          const Text(
                            "Order Summary",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 248, 207, 0)),
                                  color: const Color.fromARGB(255, 36, 36, 36),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                50,
                                      ),
                                      Text(
                                        FirebaseAuth.instance.currentUser
                                                ?.displayName ??
                                            "name",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                50,
                                      ),
                                      Text(
                                        FirebaseAuth.instance.currentUser
                                                ?.phoneNumber ??
                                            "number",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(255, 248, 207, 0),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          const Text(
                            "Payment Method",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                visa = true;
                                master = false;
                                cash = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  visa == false
                                      ? Icons.circle_outlined
                                      : Icons.check_circle,
                                  color: const Color.fromARGB(255, 248, 207, 0),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                                const Text(
                                  "Visa",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                visa = false;
                                master = true;
                                cash = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  master == false
                                      ? Icons.circle_outlined
                                      : Icons.check_circle,
                                  color: const Color.fromARGB(255, 248, 207, 0),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                                const Text(
                                  "Master card",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                visa = false;
                                master = false;
                                cash = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  cash == false
                                      ? Icons.circle_outlined
                                      : Icons.check_circle,
                                  color: const Color.fromARGB(255, 248, 207, 0),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                                const Text(
                                  "Cash",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Text(
                            "Total : $total",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final user =
                                  context.read<AuthenticationBloc>().state.user;
                              context.read<CartBloc>().add(Clear(user!.uid));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentStats(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size.fromHeight(50),
                                backgroundColor:
                                    const Color.fromARGB(255, 248, 207, 0)),
                            child: const Text(
                              "Proceed to checkout",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
