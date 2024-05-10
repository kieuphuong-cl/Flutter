import 'package:brainiaccommerce2/controller/authentication_controller.dart';
import 'package:brainiaccommerce2/core/ui/style/base_color.dart';
import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/screens/acount/login_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/common_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterData {
  final String accountID;
  final String fullName;
  final String phoneNumber;
  final String numberID;

  RegisterData(
      {required this.accountID,
      required this.fullName,
      required this.phoneNumber,
      required this.numberID});
}

class CompleteSignUpScreen extends StatefulWidget {
  const CompleteSignUpScreen({super.key, required this.data});
  final RegisterData data;

  @override
  State<CompleteSignUpScreen> createState() => _CompleteSignUpScreenState();
}

class _CompleteSignUpScreenState extends State<CompleteSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = [
      'Nam',
      'Nữ',
    ];
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController rePasswordController = TextEditingController();
    final TextEditingController BirthdayController = TextEditingController();
    final TextEditingController schoolYearController = TextEditingController();
    final TextEditingController schoolKeyController = TextEditingController();
    String? gender;
    DropdownButtonFormField2<String> _dropDownButton(List<String> genderItems) {
      return DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          // Add more decoration..
        ),
        hint: Text(
          'Chọn giới tính',
          style: BaseTextStyle.body2(color: BaseColor.greyNeutral600),
        ),
        items: genderItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: BaseTextStyle.body2()),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Vui lòng chọn giới tính.';
          }
          return null;
        },
        onChanged: (value) {
          //Do something when selected item is changed.
          gender = value;
        },
        onSaved: (value) {
          // selectedValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      );
    }

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
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      hintText: "Vui lòng nhập mật khẩu",
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: rePasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Nhập lại mật khẩu",
                      hintText: "Vui lòng nhập lại mật khẩu",
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 15),
                  _dropDownButton(genderItems),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: BirthdayController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Ngày sinh",
                      hintText: "Nhập ngày sinh",
                      prefixIcon: Icon(Icons.cake),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: schoolYearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Năm học",
                      hintText: "Nhập năm học",
                      prefixIcon: Icon(Icons.school),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: schoolKeyController,
                    decoration: InputDecoration(
                      labelText: "Khoá học",
                      hintText: "Nhập khoá học",
                      prefixIcon: Icon(Icons.key),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CommonButton(
                    text: "Đăng ký",
                    press: () async {
                      if (passwordController.text.isEmpty ||
                          rePasswordController.text.isEmpty ||
                          BirthdayController.text.isEmpty ||
                          schoolKeyController.text.isEmpty ||
                          schoolYearController.text.isEmpty) {
                        showSnackBar(
                            content: "Vui lòng nhập đầy đủ thông tin",
                            state: SnackbarState.fail);
                        return;
                      }
                      if (passwordController.text !=
                          rePasswordController.text) {
                        showSnackBar(
                            content: "Mật khẩu không hợp lệ!",
                            state: SnackbarState.fail);
                        return;
                      }
                      if (gender == null) {
                        showSnackBar(
                            content: "Vui lòng chọn giới tính",
                            state: SnackbarState.fail);
                        return;
                      }
                      AuthenticationController controller = Get.find();
                      showLoadingAnimation(context);
                      var rs = await controller.register(
                          accountId: widget.data.accountID,
                          fullName: widget.data.fullName,
                          phoneNumber: widget.data.phoneNumber,
                          numberId: widget.data.numberID,
                          password: passwordController.text,
                          rePassword: rePasswordController.text,
                          gender: gender!,
                          birthDay: BirthdayController.text,
                          schoolKey: schoolKeyController.text,
                          schoolYear: schoolYearController.text);
                      await Future.delayed(Duration(milliseconds: 1000));

                      Navigator.pop(context);

                      if (rs) {
                        showSnackBar(
                          content: "Đăng ký thành công",
                        );
                        return;
                      } else {
                        showSnackBar(
                            content: "Tài khoản đã tồn tại",
                            state: SnackbarState.fail);
                        return;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn đã có tài khoản?",
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
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Đăng nhập ngay",
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
