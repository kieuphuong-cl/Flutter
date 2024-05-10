import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.description,
  });
  final String name;
  final String price;
  final String imgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: SizedBox(
        width: 156,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: 140,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 13,
                        offset: Offset(4, 4))
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${name}",
              style: BaseTextStyle.label2(),
              maxLines: 2,
            ),
            Text(
              "${description.substring(0, 70)}...",
              style: BaseTextStyle.body3(color: Colors.grey.shade500),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${formatVND(int.parse(price))}",
                  style: BaseTextStyle.label2(color: kPrimaryColor),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 26,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
