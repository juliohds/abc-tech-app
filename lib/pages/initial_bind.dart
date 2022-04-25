import 'package:abctechapp/controller/initial_controller.dart';
import 'package:get/get.dart';

class InitialBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}