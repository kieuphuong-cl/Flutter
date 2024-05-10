import 'package:brainiaccommerce2/controller/authentication_controller.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/common_flutter.dart';
import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final controllerAccountID = TextEditingController();
  final controllerNumberID = TextEditingController();
  final controllerNewPass = TextEditingController();

  @override
  void dispose() {
    controllerAccountID.dispose();
    controllerNumberID.dispose();
    controllerNewPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quên mật khẩu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Nhập thông tin tài khoản của bạn",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: controllerAccountID,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "ID Tài khoản",
                hintText: "Nhập ID tài khoản",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controllerNumberID,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "Mã ID",
                hintText: "Nhập mã ID",
                prefixIcon: Icon(Icons.info),
              ),
            ),
            SizedBox(height: 20),
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
              text: "Cập nhật mật khẩu",
              press: () async {
                if (controllerAccountID.text.isEmpty ||
                    controllerNumberID.text.isEmpty ||
                    controllerNewPass.text.isEmpty) {
                  showSnackBar(
                    content: "Vui lòng nhập đầy đủ thông tin",
                    state: SnackbarState.fail,
                  );
                  return;
                }

                showLoadingAnimation(context);
                var isSuccess = await AuthenticationController().forgotPass(
                  controllerAccountID.text,
                  controllerNumberID.text,
                  controllerNewPass.text,
                );
                Navigator.pop(context);

                if (isSuccess) {
                  showSnackBar(content: "Cập nhật mật khẩu thành công");
                } else {
                  showSnackBar(
                    content: "Cập nhật mật khẩu thất bại",
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
