import 'package:brainiaccommerce2/controller/authentication_controller.dart';
import 'package:brainiaccommerce2/controller/cart_controller.dart';
import 'package:brainiaccommerce2/controller/favourite_controller.dart';
import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/screens/acount/login_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loadController();
  runApp(MyApp());
}

void loadController() {
  Get.put(AuthenticationController());
  Get.put(CartController());
  Get.put(FavouriteController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Brainiac ECommerce",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: themeData(),
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Color(0xff8b8b8b),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    fontFamily: BaseTextStyle.baseFont,
    inputDecorationTheme: inputDecorationTheme(),
    iconTheme: const IconThemeData(),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kTextColor, fontSize: 18),
        bodySmall: TextStyle(color: kTextColor, fontSize: 18),
        bodyMedium: TextStyle(color: kTextColor, fontSize: 18)),
    scaffoldBackgroundColor: Colors.white,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 18, color: kPrimaryColor),
      hintStyle: const TextStyle(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusedBorder: outlineInputBorder(),
      focusedErrorBorder: outlineErrorBorder(),
      errorBorder: outlineErrorBorder(),
      border: outlineInputBorder(),
      enabledBorder: outlineInputBorder());
}

OutlineInputBorder outlineInputBorder() {
  return const OutlineInputBorder(
      gapPadding: 10,
      borderSide: BorderSide(color: kTextColor),
      borderRadius: BorderRadius.all(Radius.circular(28)));
}

OutlineInputBorder outlineErrorBorder() {
  return const OutlineInputBorder(
      gapPadding: 10,
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(28)));
}
