import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodiebuddie/view/screen/cart/screen_cart.dart';
import 'package:foodiebuddie/view/screen/home/screen_home.dart';
import 'package:foodiebuddie/view/screen/profile/screen_profile.dart';
import 'package:foodiebuddie/view/screen/restaurants/screen_restaurants.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final List screens = [
    ScreenHome(),
    ScreenRestaurants(),
    ScreenCart(),
    const ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.index],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.green[50],
            selectedItemColor: Colors.green[900],
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (value) {
              context
                  .read<BottomNavigationBloc>()
                  .add(BottomNavigationEvent(index: value));
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icons/foods.png')),
                  label: 'Foods'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icons/restaurant.png')),
                  label: 'Restaurants'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icons/cart.png')),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage('assets/images/icons/profile.png')),
                  label: 'Profile')
            ],
          ),
        );
      },
    );
  }
}
