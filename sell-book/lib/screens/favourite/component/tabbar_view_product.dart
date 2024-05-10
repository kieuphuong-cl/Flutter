import 'package:brainiaccommerce2/controller/favourite_controller.dart';
import 'package:brainiaccommerce2/screens/favourite/component/product-card-item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TabbarViewProduct extends StatelessWidget {
  const TabbarViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController controller = Get.find();
    return Obx(() {
      if (controller.lists.isEmpty) {
        return LottieBuilder.asset("assets/animations/shimmer.json");
      }
      return GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 40,
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 4 / 7,
        children: [
          ...List.generate(
              controller.lists.length,
              (index) => ProductCardItem(
                    model: controller.lists[index],
                  ))
        ],
      );
    });
    //   ));
  }
}
