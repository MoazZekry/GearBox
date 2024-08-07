import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/event.dart';

import 'package:gearbox3/data/product/products.dart';
import 'package:gearbox3/screens/ordersummary.dart';

import 'package:gearbox3/widgets/productcart.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, AuthenticationState>(
      builder: (context, state) {
        final user =
            context.select((AuthenticationBloc bloc) => bloc.state.user);

        if (user != null) {
          context.read<CartBloc>().add(FetchCart(user.uid));
        }

        final List<MapEntry<int, int>> mapEntries = state.cart.entries.toList();
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 248, 207, 0),
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 4.5,
                child: const Center(
                  child: Center(
                    child: Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.width / 2.7),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListView.builder(
                  itemCount: state.cart.length + 2,
                  itemBuilder: (context, index) {
                    if (state.cart.isNotEmpty) {
                      if (index == state.cart.length + 1) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderSummaryScreen(),
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
                            "Checkout",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                        );
                      }
                      if (index == state.cart.length) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        );
                      }
                      final mapEntry = mapEntries[index];
                      return CartItem(item: productItems[mapEntry.key]!);
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
