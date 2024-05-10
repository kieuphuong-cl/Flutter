// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brainiaccommerce2/controller/favourite_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'package:brainiaccommerce2/model/favourite_model.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:get/get.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  final FavoriteModel model;

  @override
  Widget build(BuildContext context) {
    FavouriteController controler = Get.find();
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                width: 160,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: kSecondaryColor.withOpacity(0.3))),
                    child: CachedNetworkImage(
                      imageUrl: model.imgUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator.adaptive(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 3,
                right: 3,
                child: GestureDetector(
                  onTap: () {
                    controler.evenClickFavourite(model.id);
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        'assets/icons/Heart Icon_2.svg',
                        color: true
                            ? const Color(0xffFF4848)
                            : const Color(0xffDBDEE4),
                      )),
                ),
              ),
            ],
          ),
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            children: [
              Text(
                '5',
                style: const TextStyle(fontSize: 14),
              ),
              RatingBar.builder(
                ignoreGestures: true,
                itemSize: 14,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                initialRating: double.parse('5'),
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                onRatingUpdate: (value) {},
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${formatVND(int.parse(model.price))}",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
