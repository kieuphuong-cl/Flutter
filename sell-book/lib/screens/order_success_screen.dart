import 'package:brainiaccommerce2/screens/navigation_screen.dart';
import 'package:brainiaccommerce2/widgets/container_buton_model.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "images/success.png",
                  height: 250,
                ),
                SizedBox(height: 15),
                Text(
                  "Đặt hàng thành công!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Đơn hàng của bạn sẽ được nhanh chóng vận chuyển.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Cảm ơn bạn đã mua hàng ở Brainiac!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationScreen(),
                      ));
                },
                child: ContainerButtonModel(
                  itext: "Tiếp tục mua hàng",
                  containerWidth: MediaQuery.of(context).size.width,
                  bgColor: Color(0xFFDB3022),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
