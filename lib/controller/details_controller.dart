import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  int count = 1;

  void increment() {
    Get.closeAllSnackbars();
    if (count == 100) {
      Get.snackbar(
        'Error',
        'Max count for buy 100 coffee',
        colorText: Colors.white,
      );
      return;
    }
    ++count;
    update();
  }

  void decrement() {
    Get.closeAllSnackbars();
    if (count == 1) {
      Get.snackbar(
        'Error',
        'Min count for buy 1 coffee',
        colorText: Colors.white,
      );
      return;
    }
    --count;
    update();
  }
}
