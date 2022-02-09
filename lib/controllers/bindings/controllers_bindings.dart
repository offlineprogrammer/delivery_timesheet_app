import 'package:delivery_timesheet_app/controllers/driver_controller.dart';
import 'package:get/get.dart';

import '../auth_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.put<DriverController>(DriverController(), permanent: true);
  }
}
