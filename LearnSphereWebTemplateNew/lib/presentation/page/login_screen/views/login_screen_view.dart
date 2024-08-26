import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_router.dart';
import '../../../config/app_color.dart';
import '../../../config/app_contents.dart';
import '../../../config/common_textfield.dart';


import '../../../config/common_button.dart';
import '../controllers/login_screen_controller.dart';

@RoutePage()
// ignore: must_be_immutable
class LoginScreenView extends GetView<LoginScreenController> {
   LoginScreenView({super.key});
      LoginScreenController loginScreenController = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {Navigator.pop(context);},
                        child: Image.asset(Appcontent.back, height: 24,)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Text('Wellcome Back!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, fontFamily: 'Urbanist-bold'), textAlign: TextAlign.start, overflow: TextOverflow.ellipsis),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Please sign in with your account.', style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Urbanist-medium'), overflow: TextOverflow.ellipsis),
                  ),

                  Padding(padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                    child: textfield(text : 'Enter your username', text1: 'Username or Email'),
                  ),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GetBuilder<LoginScreenController>(
                        builder: (context) {
                          return TextField(
                            obscureText: loginScreenController.showPassword,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                hintText: 'Min. 8 characters...',
                                labelText: 'Password',

                                suffixIcon: InkWell(
                                  onTap: () {
                                    loginScreenController.changePasswordhideAndShow();
                                  },
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: loginScreenController.showPassword ? Image.asset('assets/eye-slash.png', height: 24, width: 24,) : const Icon(Icons.visibility_outlined, color: Color(0xff94A3B8),),
                                    ),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                )),
                          );
                        }
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(left: 210),
                    child: TextButton(onPressed: () {
                      context.router.push( ForgotRouteView());
                    },
                      child: const Text('Forgot Password?', style: TextStyle(fontSize: 14, color: AppColor.purple, fontFamily: 'Urbanist-semibold'), overflow: TextOverflow.ellipsis),
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(bottom: 16, top: 16),
                    child: Center(
                      child: elevated(text: 'Sign In',onPress: () {
                         context.router.push(const DashboardRoute());
                      },),
                    ),
                  ),
                  const Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Divider(thickness: 1, color: Color(0xffE2E8F0),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(child: Text('Or', style: TextStyle(fontSize: 14, fontFamily: 'Urbanist', color: Colors.grey))),
                      ),
                      Expanded(
                        flex: 4,
                        child: Divider(thickness: 1, color: Color(0xffE2E8F0)),
                      ),
                    ],
                  ),

                  Padding(padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(fixedSize: const Size(327, 56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Image(image: AssetImage(Appcontent.google)),
                            ),
                            SizedBox(width: 10),
                            Text('Sign In With Google', style: TextStyle(fontSize: 16,color: Colors.black, fontFamily: 'Urbanist-semibold'), overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(fixedSize: const Size(327, 56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Image(image: AssetImage(Appcontent.apple)),
                            ),
                            SizedBox(width: 10),
                            Text('Sign In With Apple', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Urbanist-semibold'), overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                
                  const Expanded(child: SizedBox(height: 20,)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
