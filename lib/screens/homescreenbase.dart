import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/data/global.dart';
import 'package:gearbox3/screens/account.dart';
import 'package:gearbox3/screens/boardingscrren1.dart';
import 'package:gearbox3/screens/categories.dart';
import 'package:gearbox3/screens/homescreen.dart';
import 'package:gearbox3/screens/myorder.dart';

class HomeScreenBase extends StatefulWidget {
  const HomeScreenBase({super.key});

  @override
  State<HomeScreenBase> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenBase> {
  List<Widget> screens = const [
    HomeScreen(),
    CategoriesScreen(),
    MyOrderScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatues.unauthenticated ||
            state.status == AuthenticationStatues.unknown) {
          return const BoardingScreenOne();
        } else {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 25, 25, 25),
            body: screens[screenIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              currentIndex: screenIndex,
              onTap: (index) {
                setState(() {
                  screenIndex = index;
                });
              },
              backgroundColor: const Color.fromARGB(255, 36, 36, 36),
              unselectedItemColor: Colors.grey,
              selectedItemColor: const Color.fromARGB(255, 248, 207, 0),
              items: const [
                BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.folderTree,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'My Order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: 'Account',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
