import 'package:brainiaccommerce2/controller/home_controller.dart';
import 'package:brainiaccommerce2/screens/ItemScreen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/net_work_cache_image.dart';
import 'package:brainiaccommerce2/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/CategoriesWidget.dart';

List<String> imagesList2 = [
  "https://img1.etsystatic.com/197/0/14200326/il_fullxfull.1267148033_pa5j.jpg",
  "https://i.pinimg.com/originals/2c/c5/95/2cc595a0018f2af3481b19a0b00cd69a.jpg",
  "https://th.bing.com/th/id/R.fe1bd1074c74deebc6736419107e2719?rik=cGlqYttAfbPJhQ&pid=ImgRaw&r=0",
  "https://hips.hearstapps.com/hmg-prod/images/ata100123cbgcovers-lo-64dd04077fc05.jpg?crop=1xw:0.6666666666666666xh;center,top&resize=1200:*",
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var x = Get.put(HomeController());
    x.loadUserInfo();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.35,
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            hintText: "Tìm kiếm",
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFFDB3022),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12.withOpacity(0.05),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.notifications_none,
                              color: Color(0xFFDB3022),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  //Category
                  Text(
                    "Danh mục sản phẩm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  CategoriesWidget(),
                  SizedBox(height: 20),
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        // pauseAutoPlayOnTouch: false,
                        autoPlayCurve: Curves.fastOutSlowIn),
                    items: imagesList2.map((image) {
                      return Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              offset: Offset(4, -6),
                              color: Colors.black26),
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ImageNetWorkWidget(url: image),
                        ),
                      );
                    }).toList(),
                  ),

                  //Popular Items
                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Text(
                      "Phổ biến",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  _ProductList(x),

                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Text(
                      "Flash Sale",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  _ProductList(x),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _ProductList(HomeController x) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
          future: x.getListProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.length == 0) {
                return CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    snapshot.data!.length,
                    (index) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemScreen(
                                id: snapshot.data![index].id!.toString(),
                                discription: snapshot.data![index].description!,
                                name: snapshot.data![index].name!,
                                price: snapshot.data![index].price!.toString(),
                                url: snapshot.data![index].imageUrl!,
                              ),
                            ));
                      },
                      child: ProductCard(
                        description: snapshot.data![index].description!,
                        imgUrl: snapshot.data![index].imageUrl!,
                        name: snapshot.data![index].name!,
                        price: snapshot.data![index].price!.toString(),
                      ),
                    ),
                  ),
                ],
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(kPrimaryColor),
              );
            }
            if (snapshot.hasError) {
              return Text("error");
            }
            return SizedBox.shrink();
          }),
    );
  }
}
