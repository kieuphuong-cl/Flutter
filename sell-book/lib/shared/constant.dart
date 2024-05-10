import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

enum SnackbarState { success, fail }

void showLoadingAnimation(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Lottie.asset('assets/animations/loadingg.json',
                width: 140, height: 140)),
      );
    },
  );
}

void showSnackBar({required String content, SnackbarState? state}) {
  Get.snackbar('Thông báo', content,
      icon: (state == null)
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : Icon(
              Icons.error,
              color: kPrimaryColor,
            ),
      shouldIconPulse: true,
      isDismissible: true,
      barBlur: 20,
      titleText: Text(
        'Thông báo',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: (state == null) ? Colors.green : kPrimaryColor),
      ));
}

String formatVND(int amount) {
  // Tạo một đối tượng NumberFormat để định dạng số thành tiền Việt Nam đồng
  final formatter = NumberFormat("#,### Đ", "vi");
  // Sử dụng phương thức format() để định dạng số
  return formatter.format(amount);
}

const kPrimaryColor = Color(0xffDB3022);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kExistAccount = 'Tài khoản này không tồn tại';
const String kInvalidUsernamePassword =
    'Tài khoản hoặc mật khẩu không chính xác';
const String kInvalidEmail = "Định dạng email không hợp lệ";
const String kUserNullError = "Vui lòng nhập username";
const String kEmailError = "Vui lòng nhập email";
const String kPassNullError = "Vui lòng nhập mật khẩu";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Mật khẩu không khớp nhau";
const String kNamelNullError = "Vui lòng nhập tên";
const String kPhoneNumberNullError = "Vui lòng nhập số điện thoại";
const String kAddressNullError = "Vui lòng nhập địa chỉ";

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
  );
}

double convertCurrencyVNDtoUSD(double amountInVND) {
  // Tỷ giá cố định: 1 USD = 23000 VND
  double exchangeRate = 23000;

  // Thực hiện chuyển đổi
  double convertedAmount = amountInVND / exchangeRate;

  return convertedAmount;
}
