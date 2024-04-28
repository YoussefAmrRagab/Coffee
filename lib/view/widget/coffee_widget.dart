import 'package:get/get.dart';

import '../../model/coffee.dart';
import '../../utils/extensions.dart';
import '../../res/color_manager.dart';
import 'package:flutter/material.dart';

class CoffeeWidget extends StatelessWidget {
  const CoffeeWidget({
    super.key,
    required this.coffee,
    required this.icon,
    required this.onIconTap,
  });

  final Coffee coffee;
  final IconData icon;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/DETAILS', arguments: coffee);
      },
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        margin: const EdgeInsets.all(4),
        color: ColorManager.primaryColor,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Image.asset(
              'assets/images/${coffee.image}',
              height: 112,
              width: 100,
            ),
            6.0.mh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      coffee.category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    10.0.mh,
                    Text(
                      '${coffee.price}\$',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onIconTap,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: Colors.white),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
