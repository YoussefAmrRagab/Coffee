import '../../view/main_screens.dart';
import '../../utils/app_binding.dart';
import 'package:get/get.dart';
import '../../view/home_screen.dart';
import '../../res/color_manager.dart';
import '../../view/profile_screen.dart';
import '../../view/details_screen.dart';
import '../../view/favourite_screen.dart';
import '../../view/notification_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        canvasColor: ColorManager.primaryColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: ColorManager.primaryColor,
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.transparent,
          backgroundColor: ColorManager.primaryColor,
        ),
      ),
      initialBinding: AppBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainScreen()),
        GetPage(name: '/HOME', page: () => const HomeScreen()),
        GetPage(name: '/DETAILS', page: () => DetailsScreen()),
        GetPage(name: '/FAVOURITE', page: () => const FavouriteScreen()),
        GetPage(name: '/NOTIFICATION', page: () => const NotificationScreen()),
        GetPage(name: '/PROFILE', page: () => const ProfileScreen()),
      ],
    );
  }
}
