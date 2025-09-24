
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../utils/common_style.dart';
//
// import '../common/common_style.dart';
// import '../controller/login_controller.dart';
// import '../controllers/login_controller.dart';


class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  final emailController = TextEditingController(text: 'shubhamevolve20@gmail.com');
  final passwordController = TextEditingController(text: "Shubham@123");

  final RxBool isPasswordVisible = false.obs;

  final deviceId = 'your_device_id';
  final deviceType = 'Android';

  @override
  Widget build(BuildContext context) {

    late double screenWidth = MediaQuery.of(context).size.width;
    late double screenHeight =MediaQuery.of(context).size.height;
    return Scaffold(
      //appBar: AppBar(title: Text("Login")),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:screenHeight* 0.04),
              Center(
                child: Image.asset(
                  'assets/images/health.png',
                  height: screenHeight* 0.20,
                ),
              ),
              SizedBox(height:screenHeight* 0.07),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text("Email", style: AppStyle.Heading18Light),
              ),
              // SizedBox(height:screenHeight* 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 5),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:AppStyle.textSecondary), // Default border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:AppStyle.border, width: 2.0), // Focused border color
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              //SizedBox(height:screenHeight* 0.03),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text("Password", style:  AppStyle.Heading18Light),
              ),
              //SizedBox(height:screenHeight* 0.03),


              // 🔁 Use Obx for reactive password visibility
              Obx(() => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 5),
                child: TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible.value,

                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:AppStyle.textSecondary), // Default border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:AppStyle.border, width: 2.0), // Focused border color
                    ),
                    border:  OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                    ),
                  ),
                ),
              )),

              SizedBox(height:screenHeight* 0.1),


              Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 5),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(

                    onPressed: () {
                      controller.loginUser(
                        strEmail: emailController.text.trim(),
                        strPassword: passwordController.text.trim(),
                        strDeviceID: deviceId,
                        strDeviceType: deviceType,
                      );
                    },
                    style: ElevatedButton.styleFrom(

                      backgroundColor: AppStyle.Button,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text('Login',style: AppStyle.button16Bold),
                  ),
                ),
              )




              ),
              // SizedBox(height:screenHeight* 0.03),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "Don't have account? ",
                    style:AppStyle.text16bold,
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: AppStyle.error18bold,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle register tap here
                            print('Register clicked');
                          },
                      ),
                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}




