import 'package:get/get.dart';

import '../views/dashboard_screen.dart';

// Mock LoginResponse model
class LoginResponse {
  final bool status;
  final String message;
  final String? token; // optional token

  LoginResponse({required this.status, required this.message, this.token});
}

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginResponse = Rxn<LoginResponse>();

  var status;

  // Mock login method
  Future<void> loginUser({
    required String strEmail,
    required String strPassword,
    required String strDeviceID,
    required String strDeviceType,
  }) async {
    isLoading.value = true;

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Mocked response
    if (strEmail == "test@example.com" && strPassword == "123456") {
      loginResponse.value = LoginResponse(
        status: true,
        message: "Login successful",
        token: "mocked_jwt_token_123",
      );
      print("✅ Mock Login Success: ${loginResponse.value?.message}");

      isLoading.value = false;

      // Navigate to dashboard
      Get.to(() => DashboardScreen());
    } else {
      loginResponse.value = LoginResponse(
        status: false,
        message: "Invalid email or password",
      );
      print("❌ Mock Login Failed: ${loginResponse.value?.message}");
      isLoading.value = false;
    }
  }
}


