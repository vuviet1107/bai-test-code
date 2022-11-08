import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class BaseController extends GetxController {
  final _loadingStatus = BehaviorSubject<bool>.seeded(false);
  final arguments = Get.arguments;

  Stream<bool> get loadingStatus => _loadingStatus.stream;

  @override
  void onInit() {
    super.onInit();
  }

  // setLoading(bool value) {
  //   _loadingStatus.add(value);
  // }
  setLoading(bool  value) {
    if (!isClosed) {
      _loadingStatus.add(value);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _loadingStatus.close();
    super.onClose();
  }

  void onError(String statusCode, String message) {}

}
