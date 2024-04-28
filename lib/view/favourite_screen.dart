import '../controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/coffee_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<AppController>();

    return GetBuilder<AppController>(
      builder: (controller) => controller.favourite.isEmpty
          ? const Center(
              child: Text(
                'No favourite coffee added yet',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.86,
              ),
              itemCount: controller.favourite.length,
              itemBuilder: (context, index) => CoffeeWidget(
                coffee: controller.favourite[index],
                icon: Icons.favorite_rounded,
                onIconTap: () {
                  controller.onFavouriteClick(controller.favourite[index]);
                },
              ),
            ),
    );
  }
}
