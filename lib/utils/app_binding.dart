import '../controller/details_controller.dart';
import '../controller/app_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController(), permanent: true);
    Get.lazyPut(() => DetailsController(), fenix: true);
  }
}
