// import 'package:clippy_flutter/arc.dart';
import 'package:brainiaccommerce2/controller/favourite_controller.dart';
import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/model/favourite_model.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/net_work_cache_image.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../widgets/ItemBottomNavBar.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen(
      {super.key,
      required this.id,
      required this.url,
      required this.discription,
      required this.price,
      required this.name});
  final String url, discription, price, name, id;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  FavouriteController controller = Get.find();

  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey[100])),
              iconSize: 18,
              onPressed: () {
                controller.addFavourite(FavoriteModel(
                    id: widget.id,
                    imgUrl: widget.url,
                    name: widget.name,
                    price: widget.price));
                setState(() {
                  isFavourite = true;
                });
              },
              icon: Icon(
                (!isFavourite) ? Icons.favorite_outline : Icons.favorite,
                color: kPrimaryColor,
              ))
        ],
        centerTitle: true,
        title: Text('Chi tiết sản phẩm'),
      ),
      body: SizedBox.expand(
        child: ListView(
          children: [
            SizedBox(height: 300, child: ImageNetWorkWidget(url: widget.url)),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 60,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 16,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            Flexible(
                              child: Text(
                                  "${formatVND(int.parse(widget.price))}",
                                  style: BaseTextStyle.label2(
                                      color: kPrimaryColor)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text(widget.name, style: BaseTextStyle.h6())),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Icon(
                                Icons.airport_shuttle,
                                color: Colors.orange,
                              ),
                            ),
                            Text(
                              "Miễn phí giao hàng",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Icon(
                                Icons.confirmation_number_outlined,
                                color: Colors.orange,
                              ),
                            ),
                            Text(
                              "Ưu đãi",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          widget.discription,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ItemBottomNavBar(
          id: widget.id,
          discription: this.widget.discription,
          name: this.widget.name,
          price: this.widget.price,
          url: this.widget.url),
    );
  }
}
