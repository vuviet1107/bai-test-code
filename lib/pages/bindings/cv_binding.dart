import 'package:get/get.dart';
import 'package:untitled/pages/persentation/controllers/sc_controller.dart';
import 'package:untitled/pages/repository/chat_repository.dart';
import 'package:untitled/pages/repository/repository_adapter.dart';

class CvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICvRepository>(() => CvResponse(
        // apiClient: Get.find()
        ));
    Get.lazyPut(() => CvController());
  }
}
