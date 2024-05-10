import 'package:brainiaccommerce2/controller/cart_controller.dart';
import 'package:brainiaccommerce2/model/cart_item_model.dart';
import 'package:brainiaccommerce2/screens/cart_screen.dart';
import 'package:brainiaccommerce2/screens/navigation_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/container_buton_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBottomNavBar extends StatelessWidget {
  const ItemBottomNavBar(
      {super.key,
      required this.url,
      required this.discription,
      required this.price,
      required this.name,
      required this.id});
  final String url, discription, price, name, id;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                showLoadingAnimation(context);
                CartController controller = Get.find();
                var x = CartItemModel(
                    id: id, imgUrl: url, name: name, price: price);
                controller.addToCard(x);
                await Future.delayed(Duration(milliseconds: 700));
                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationScreen(),
                    ));
              },
              child: SizedBox(
                width: 200,
                height: 50,
                child: ContainerButtonModel(
                  itext: "Mua hàng",
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
