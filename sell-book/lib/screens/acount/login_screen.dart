import 'package:brainiaccommerce2/controller/authentication_controller.dart';
import 'package:brainiaccommerce2/screens/navigation_screen.dart';
import 'package:brainiaccommerce2/screens/acount/signup_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/common_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgotpass_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();

    super.dispose();
  }

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextField(
                    controller: controllerUsername,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Tên đăng nhập",
                      hintText: "Nhập tên đăng nhập",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: controllerPassword,
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      hintText: "Nhập mật khẩu",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: (isHidden)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassScreen(),
                            ));
                      },
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonButton(
                      text: "Đăng nhập",
                      press: () async {
                        if (this.controllerUsername.text.isEmpty ||
                            this.controllerPassword.text.isEmpty) {
                          showSnackBar(
                              content: "Vui lòng điền đầy đủ thông tin",
                              state: SnackbarState.fail);
                          return;
                        }
                        AuthenticationController x = Get.find();
                        showLoadingAnimation(context);
                        var isSuccess = await x.login(
                            accountId: controllerUsername.text,
                            password: controllerPassword.text);
                        await Future.delayed(Duration(milliseconds: 1000));
                        Navigator.pop(context);
                        if (isSuccess) {
                          showSnackBar(content: "Đăng nhập thành công");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(),
                              ));
                          return;
                        } else {
                          showSnackBar(
                              content: "Đăng nhập thất bại",
                              state: SnackbarState.fail);
                          return;
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
