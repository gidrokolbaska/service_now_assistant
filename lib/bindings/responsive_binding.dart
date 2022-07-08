import 'package:get/get.dart';
import 'package:service_now_assistant/controllers/responsive_controller.dart';

class ResponsiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ResponsiveController>(ResponsiveController());
  }
}
