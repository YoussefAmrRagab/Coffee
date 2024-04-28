import '../controller/app_controller.dart';
import '../view/favourite_screen.dart';
import '../view/home_screen.dart';
import '../view/notification_screen.dart';
import '../view/profile_screen.dart';
import 'package:get/get.dart';

import '../utils/extensions.dart';
import '../res/color_manager.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.find<AppController>();

    return Scaffold(
      appBar: appBar(),
      body: GetBuilder<AppController>(
        builder: (controller) => screens[controller.currIndex],
      ),
      bottomNavigationBar: GetBuilder<AppController>(
        builder: (controller) => BottomNavigationBar(
            elevation: 3,
            backgroundColor: ColorManager.primaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black,
            currentIndex: controller.currIndex,
            onTap: (index) {
              controller.navigate = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ]),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: GetBuilder<AppController>(
        builder: (controller) => controller.currIndex == 0
            ? const Icon(Icons.menu_rounded, color: Colors.grey)
            : const SizedBox(),
      ),
      centerTitle: true,
      title: GetBuilder<AppController>(
        builder: (controller) => controller.currIndex == 1
            ? const Text(
                'Favourites',
                style: TextStyle(fontSize: 28),
              )
            : const SizedBox(),
      ),
      actions: [
        GetBuilder<AppController>(
          builder: (controller) => controller.currIndex == 0
              ? const Icon(Icons.notifications_rounded, color: Colors.grey)
              : const SizedBox(),
        ),
        14.0.mw,
      ],
    );
  }
}
