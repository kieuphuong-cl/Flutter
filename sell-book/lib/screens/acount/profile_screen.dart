import 'package:brainiaccommerce2/controller/home_controller.dart';
import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/screens/about_screen.dart';
import 'package:brainiaccommerce2/screens/product/product_screen.dart';
import 'package:brainiaccommerce2/screens/acount/edit_profile_screen.dart';
import 'package:brainiaccommerce2/screens/favourite/favourite_screen.dart';
import 'package:brainiaccommerce2/screens/acount/login_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/container_buton_model.dart';
import 'package:brainiaccommerce2/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'changepass.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}); // Sửa đổi ở đây

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Tài khoản",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://haycafe.vn/wp-content/uploads/2022/10/Hinh-anh-avatar-nu-dep.jpg"),
            ),
            Obx(
              () => Text(
                controller.user.value.fullName!,
                //appProvider.getUserInfomation.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(
              () => Text(
                controller.user.value.phoneNumber!,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProfileScreen(),
                  ),
                );
              },
              child: ContainerButtonModel(
                itext: "Chỉnh sửa",
                containerWidth: MediaQuery.of(context).size.width / 3,
                bgColor: Color(0xFFDB3022),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(),
                          ),
                        );
                      },
                      leading: const Icon(Icons.shopping_bag_outlined),
                      title: const Text("Sản phẩm"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavouriteScreen(),
                          ),
                        );
                      },
                      leading: const Icon(Icons.favorite_outline),
                      title: const Text("Sản phẩm yêu thích"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutScreen(),
                          ),
                        );
                      },
                      leading: const Icon(Icons.info_outline),
                      title: const Text("Về chúng tôi"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.support),
                      title: const Text("Hỗ trợ"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePasswordScreen(),
                          ),
                        );
                      },
                      leading: const Icon(Icons.change_circle_outlined),
                      title: const Text("Đổi mật khẩu"),
                    ),
                    ListTile(
                      onTap: () async {
                        showLoadingAnimation(context);
                        await Future.delayed(Duration(milliseconds: 1000));
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text("Đăng xuất"),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Brainiac Store since 2024.",
                      style: BaseTextStyle.body3(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
