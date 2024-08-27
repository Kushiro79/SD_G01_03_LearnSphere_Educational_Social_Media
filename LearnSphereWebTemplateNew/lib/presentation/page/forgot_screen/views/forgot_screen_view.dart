
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_router.dart';
import '../../login_screen/views/login_screen_view.dart';
import '../../../config/app_contents.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../../config/app_color.dart';
import '../../../config/common_button.dart';
import '../../../config/common_textfield.dart';
import '../controllers/forgot_screen_controller.dart';

@RoutePage()
class ForgotScreenView extends GetView<ForgotScreenController> {
  ForgotScreenView({super.key});
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
  }
  
  Future passwordReset(BuildContext context) async {
    try {
      final signInmethods = await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text.trim());
      
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 374,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(Appcontent.password),
                ),
                const Text('Recovery password Successfully', style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Urbanist-semibold')),
                const Text('Please login again to get started.', style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Urbanist-regular')),

                Padding(padding: const EdgeInsets.only(left: 8,bottom: 16, top: 30),
                  child: elevated(text: 'Sign In',onPress: () {
                    context.router.push( LoginRouteView());
                  },),
                ),
              ],
            ),
          );
        },
      );
    } on FirebaseAuthException catch(e) {
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Error'),
            content: Text(e.message.toString()),
          );
        }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                      child: Image.asset(Appcontent.back, height: 24,)),
                ),
                const Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image(image: AssetImage(Appcontent.forgot)),
                  ),
                ),

                const Center(child: Text('Forgot Password.', style: TextStyle(fontSize: 32, fontFamily: 'Urbanist-bold'))),
                const Center(child: Text('Enter your email account to reset\n                 your password.', style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Urbanist-medium'))),

                Padding(padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: textfield(controller: _email,text: 'Enter your Email', text1: 'Email'),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: elevated(text: 'Reset Password',onPress: () {
                      passwordReset(context);
                      /*showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 374,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(Appcontent.password),
                                ),
                                const Text('Recovery password Successfully', style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Urbanist-semibold')),
                                const Text('Please login again to get started.', style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Urbanist-regular')),

                                Padding(padding: const EdgeInsets.only(left: 8,bottom: 16, top: 30),
                                  child: elevated(text: 'Sign In',onPress: () {
                                    context.router.push( LoginRouteView());
                                  },),
                                ),
                              ],
                            ),
                          );
                        },
                      );*/
                    },),
                  ),
                ),

                const Expanded(child: SizedBox(height: 200)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Remember password ?", style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Urbanist-Light'), overflow: TextOverflow.ellipsis),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenView()),);
                      },
                      child: const Text('Sign In', style: TextStyle(fontSize: 14, color: AppColor.purple), overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
