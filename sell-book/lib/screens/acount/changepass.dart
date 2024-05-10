import 'package:brainiaccommerce2/controller/authentication_controller.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/common_flutter.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final controllerOldPass = TextEditingController();
  final controllerNewPass = TextEditingController();

  @override
  void dispose() {
    controllerOldPass.dispose();
    controllerNewPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thay đổi mật khẩu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controllerOldPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu cũ",
                hintText: "Nhập mật khẩu cũ",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: controllerNewPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu mới",
                hintText: "Nhập mật khẩu mới",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            CommonButton(
              text: "Thay đổi mật khẩu",
              press: () async {
                if (controllerOldPass.text.isEmpty ||
                    controllerNewPass.text.isEmpty) {
                  showSnackBar(
                    content: "Vui lòng nhập đầy đủ thông tin",
                    state: SnackbarState.fail,
                  );
                  return;
                }

                showLoadingAnimation(context);
                var isSuccess = await AuthenticationController().changePass(
                  controllerOldPass.text,
                  controllerNewPass.text,
                );
                Navigator.pop(context);

                if (isSuccess) {
                  showSnackBar(content: "Đổi mật khẩu thành công");
                } else {
                  showSnackBar(
                    content: "Đổi mật khẩu thất bại",
                    state: SnackbarState.fail,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}