import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:zamjy/cart.dart';
import 'package:zamjy/categories.dart';
import 'package:zamjy/reservation.dart';
import 'package:zamjy/user.dart';
import 'package:zamjy/utils/home_page.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    const HomePage(),
    const ReservationScreen(),
    CategoriesScreen(),
    const CartScreen(),
    const UserScreen(),
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        elevation: 1,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.teal,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 0 ? EvaIcons.home : EvaIcons.homeOutline),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? EvaIcons.calendar
                  : EvaIcons.calendarOutline),
              label: "Reservation"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2 ? EvaIcons.menu : EvaIcons.menu),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? EvaIcons.shoppingCart
                  : EvaIcons.shoppingCartOutline),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 4
                  ? EvaIcons.person
                  : EvaIcons.personOutline),
              label: "User"),
        ],
      ),
    );
  }
}
