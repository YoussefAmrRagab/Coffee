import '../controller/app_controller.dart';
import '../res/color_manager.dart';
import '../utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/coffee_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.find<AppController>();

    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'It\'s a Great Day for Coffee',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            16.0.mh,
            TextFormField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) => controller.filter(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorManager.secondaryColor,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                ),
                hintText: 'Find your coffee',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            2.0.mh,
            const TabBar(
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 4),
              tabs: [
                Tab(
                  text: 'Hot Coffee',
                ),
                Tab(
                  text: 'Cold Coffee',
                ),
                Tab(
                  text: 'Cappuccino',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                gridView(context),
                noCoffee(),
                noCoffee(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridView(BuildContext context) => GetBuilder<AppController>(
        builder: (controller) =>
            controller.isSearching && controller.filtered.isEmpty
                ? const Center(
                    child: Text(
                      'No coffee found',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.76,
                    ),
                    itemCount: controller.isSearching
                        ? controller.filtered.length
                        : controller.coffees.length,
                    itemBuilder: (_, index) => TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(seconds: (index + 1) * 2),
                      curve: Curves.bounceInOut,
                      builder: (context, value, child) => Opacity(
                        opacity: value,
                        child: CoffeeWidget(
                          coffee: controller.isSearching
                              ? controller.filtered[index]
                              : controller.coffees[index],
                          icon: Icons.add_rounded,
                          onIconTap: () {
                            Get.closeAllSnackbars();
                            Get.snackbar(
                              'Coming soon',
                              'This feature not working right now.',
                              colorText: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
      );

  Widget noCoffee() => const Center(
        child: Text(
          'No coffee yet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      );
}
