import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/modules/bindings/cv_binding.dart';
import 'package:untitled/modules/persentation/views/cv_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.CV_SCREEN;
  static final routes = [
    GetPage(
        name: Routes.CV_SCREEN,
      page: () => const CvScreen(),
      binding: CvBinding(),
    ),
  ];
}
