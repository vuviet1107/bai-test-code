import 'package:get/get.dart';
import 'package:untitled/cv_screen/sc_controller.dart';


class CvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
            () => CvController());
  }
}
