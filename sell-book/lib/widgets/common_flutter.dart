import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.text,
    required this.press,
    this.enable = true,
    this.backgroundColor,
  });
  final String text;
  final Color? backgroundColor;
  final VoidCallback press;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: AbsorbPointer(
        absorbing: !enable,
        child: Opacity(
          opacity: enable == true ? 1 : 0.5,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              backgroundColor: backgroundColor ?? kPrimaryColor,
            ),
            onPressed: press,
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
