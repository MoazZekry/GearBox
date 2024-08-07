// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/bloc.dart';
import 'package:gearbox3/blocs/cart_bloc/event.dart';

import 'package:gearbox3/data/product/productclass.dart';

class CartItem extends StatefulWidget {
  Product item;

  CartItem({
    super.key,
    required this.item,
  });

  @override
  State<CartItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<CartItem> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, AuthenticationState>(
      builder: (context, cartState) {
        return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5.5,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 248, 207, 0)),
                color: const Color.fromARGB(255, 36, 36, 36),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(7),
                      width: MediaQuery.of(context).size.height / 6,
                      height: MediaQuery.of(context).size.height / 6,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 25, 25, 25),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image.asset(widget.item.image)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.item.name,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  widget.item.title,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Text(
                                "${widget.item.price} \$",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Align(
                              //widthFactor: MediaQuery.of(context).size.width / 60,
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        final user = context
                                            .read<AuthenticationBloc>()
                                            .state
                                            .user;
                                        if (cartState.cart[widget.item.id]! >
                                            0) {
                                          context.read<CartBloc>().add(
                                              DecrementProductInCart(
                                                  user!.uid, widget.item.id));
                                          if (cartState.cart[widget.item.id]! ==
                                              0) {
                                            context.read<CartBloc>().add(
                                                RemoveProductFromCart(
                                                    user.uid, widget.item.id));
                                          }
                                        } else {
                                          context.read<CartBloc>().add(
                                              RemoveProductFromCart(
                                                  user!.uid, widget.item.id));
                                        }
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 10,
                                      backgroundColor:
                                          Color.fromARGB(255, 248, 207, 0),
                                      child: Center(
                                          child: Icon(
                                        Icons.remove,
                                        size: 17,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 60,
                                  ),
                                  Text(
                                    "${cartState.cart[widget.item.id]}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 60,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        final user = context
                                            .read<AuthenticationBloc>()
                                            .state
                                            .user;
                                        context.read<CartBloc>().add(
                                            IncrementProductInCart(
                                                user!.uid, widget.item.id));
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 10,
                                      backgroundColor:
                                          Color.fromARGB(255, 248, 207, 0),
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 20,
                                      )),
                                    ),
                                  ),
                                ],
                              ))),
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
                                        color:
                                            Color.fromARGB(255, 255, 227, 89),
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color:
                                            Color.fromARGB(255, 255, 227, 89),
                                      )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
