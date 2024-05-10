import 'package:brainiaccommerce2/controller/cart_controller.dart';
import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/screens/payment_method_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/container_buton_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

//Orderlist
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
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
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentMethodScreen(),
                        ));
              },
              child: SizedBox(
                width: 200,
                height: 50,
                child: ContainerButtonModel(
                  itext: "Thanh toán",
                  containerWidth: MediaQuery.of(context).size.width,
                  bgColor: Color(0xFFDB3022),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  "Danh sách đặt hàng",
                  style: TextStyle(
                    fontSize: 30,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: CartItem(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Số lượng:",
                                style: TextStyle(fontSize: 15),
                              ),
                              Obx(() => Text(
                                    "${cartController.totalItem.value}",
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tạm tính",
                                style: TextStyle(fontSize: 15),
                              ),
                              Obx(() => Text(
                                    "${formatVND(cartController.subTotal.value.toInt())}",
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Phí vận chuyển:",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "\25.000đ",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tổng cộng:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(() => Text(
                                    "${formatVND(cartController.totalCart.toInt())}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();

    return Obx(
      () {
        if (controller.lists.isEmpty) {
          return LottieBuilder.asset(
            alignment: Alignment.centerLeft,
            "assets/animations/shimmer.json",
            height: 300,
            width: 600,
            fit: BoxFit.contain,
          );
        }
        return ListView.builder(
            itemCount: controller.lists.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  itemWidget(
                    id: controller.lists[index].id,
                    amount: controller.lists[index].amount.toString(),
                    name: controller.lists[index].name,
                    price: controller.lists[index].price,
                    url: controller.lists[index].imgUrl,
                  ),
                  Divider(),
                ],
              );
            });
      },
    );
  }
}

class itemWidget extends StatelessWidget {
  const itemWidget({
    super.key,
    required this.url,
    required this.name,
    required this.price,
    required this.amount,
    required this.id,
  });
  final String url, name, price, amount, id;

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            url,
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: BaseTextStyle.body3(color: Colors.grey.shade700)),
                Text("${formatVND(int.parse(price))}",
                    style: BaseTextStyle.label2(color: kPrimaryColor)),
              ],
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.grey[100])),
                iconSize: 18,
                onPressed: () {
                  controller.decreaseItem(id);
                },
                icon: Icon(
                  Icons.remove,
                  color: kPrimaryColor,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                amount,
                style: BaseTextStyle.body2(),
              ),
            ),
            IconButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.grey[100])),
                iconSize: 18,
                onPressed: () {
                  controller.incrementItem(id);
                },
                icon: Icon(
                  Icons.add,
                  color: kPrimaryColor,
                ))
          ],
        )
      ],
    );
  }
}
