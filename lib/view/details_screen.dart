import '../controller/app_controller.dart';
import '../controller/details_controller.dart';
import '../res/color_manager.dart';
import '../utils/extensions.dart';
import '../model/coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final Coffee coffee = Get.arguments as Coffee;

  @override
  Widget build(BuildContext context) {
    Get.find<DetailsController>();
    Get.find<AppController>();

    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            18.0.mh,
            Center(
              child: Image.asset(
                'assets/images/${coffee.image}',
                width: MediaQuery.sizeOf(context).width / 1.1,
                height: MediaQuery.sizeOf(context).height / 2.8,
              ),
            ),
            const Spacer(),
            Text(
              coffee.category,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            10.0.mh,
            Text(
              coffee.name,
              style: const TextStyle(fontSize: 26, color: Colors.white),
            ),
            14.0.mh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                counter(),
                Text(
                  '\$${coffee.price}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            20.0.mh,
            Text(
              coffee.description,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            20.0.mh,
            Text(
              'Volume: ${coffee.volume}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            footer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Container counter() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: GetBuilder<DetailsController>(
        builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => controller.increment(),
              icon: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            Text(
              controller.count.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () => controller.decrement(),
              icon: const Icon(
                Icons.remove_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.closeAllSnackbars();
            Get.snackbar(
              'Coming soon',
              'This feature not working right now.',
              colorText: Colors.white,
            );
          },
          child: Container(
            width: 160,
            height: 60,
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        GetBuilder<AppController>(
          builder: (controller) => GestureDetector(
            onTap: () {
              controller.onFavouriteClick(coffee);
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                coffee.isFavourite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey),
      ),
    );
  }
}
