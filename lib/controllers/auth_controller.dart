import 'package:delivery_timesheet_app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final AuthService _authService = AuthService();

  RxBool isLoading = false.obs;
  RxBool isSignedIn = false.obs;

  @override
  void onReady() {
    isUserSignedIn();
    ever(isSignedIn, handleAuthChanged);
    super.onReady();
  }

  void isUserSignedIn() async {
    try {
      isLoading.value = true;
      isSignedIn.value = await _authService.isSignedIn();
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  handleAuthChanged(isSignedIn) {
    if (!isSignedIn) {
      print('Signed In');
      Get.offAllNamed("/signin");
    } else {
      Get.offAllNamed("/settings");
    }
  }
}
