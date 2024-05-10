// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class FlashSaleItemsWidget extends StatelessWidget {
//   //const FlashSaleItemsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         child: Column(
//           children: [
//             //for(int i = 0; i < 5; i++)
//             //Single Item _1
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 width: 380,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 3,
//                         blurRadius: 10,
//                         offset: Offset(0, 3),
//                       ),
//                     ]),
//                 child: Row(
//                   children: [
//                     InkWell(
//                         onTap: () {
//                             Navigator.pushNamed(context, "itemPage");
//                           },
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           "images/flashsale_1.jpg",
//                           height: 120,
//                           width: 150,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 190,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "Hoàng Tử Bé Vương Quốc Ulala",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Truyện Tranh Thiếu Nhi bán chạy của tháng",
//                             style: TextStyle(
//                               fontSize: 15,
//                               //fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           RatingBar.builder(
//                             initialRating: 4,
//                             minRating: 1,
//                             direction: Axis.horizontal,
//                             itemCount: 5,
//                             itemSize: 18,
//                             itemPadding: EdgeInsets.symmetric(horizontal: 4),
//                             itemBuilder: (context, _) => Icon(
//                               Icons.star,
//                               color: Colors.red,
//                             ),
//                             onRatingUpdate: (index) {},
//                           ),
//                           Text(
//                             "\12.600đ",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(
//                             Icons.favorite_border,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                           Icon(
//                             CupertinoIcons.cart,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             //Single Item_2
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 width: 380,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 3,
//                         blurRadius: 10,
//                         offset: Offset(0, 3),
//                       ),
//                     ]),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           "images/flashsale_3.jpg",
//                           height: 120,
//                           width: 150,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 190,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "Đồ Chơi Bắn Chong Chóng Hình Ếch",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Đồ chơi vận động bán chạy của tháng",
//                             style: TextStyle(
//                               fontSize: 15,
//                               //fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           RatingBar.builder(
//                             initialRating: 4,
//                             minRating: 1,
//                             direction: Axis.horizontal,
//                             itemCount: 5,
//                             itemSize: 18,
//                             itemPadding: EdgeInsets.symmetric(horizontal: 4),
//                             itemBuilder: (context, _) => Icon(
//                               Icons.star,
//                               color: Colors.red,
//                             ),
//                             onRatingUpdate: (index) {},
//                           ),
//                           Text(
//                             "\70.800đ",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(
//                             Icons.favorite_border,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                           Icon(
//                             CupertinoIcons.cart,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             //Single Item_4
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 width: 380,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 3,
//                         blurRadius: 10,
//                         offset: Offset(0, 3),
//                       ),
//                     ]),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           "images/flashsale_5.jpg",
//                           height: 120,
//                           width: 150,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 190,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "Tư Duy Về Tiền Bạc",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Sách Tài Chính - Ngân Hàng bán chạy của tháng",
//                             style: TextStyle(
//                               fontSize: 15,
//                               //fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           RatingBar.builder(
//                             initialRating: 4,
//                             minRating: 1,
//                             direction: Axis.horizontal,
//                             itemCount: 5,
//                             itemSize: 18,
//                             itemPadding: EdgeInsets.symmetric(horizontal: 4),
//                             itemBuilder: (context, _) => Icon(
//                               Icons.star,
//                               color: Colors.red,
//                             ),
//                             onRatingUpdate: (index) {},
//                           ),
//                           Text(
//                             "\52.000đ",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(
//                             Icons.favorite_border,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                           Icon(
//                             CupertinoIcons.cart,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             //Single Item_5
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 width: 380,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 3,
//                         blurRadius: 10,
//                         offset: Offset(0, 3),
//                       ),
//                     ]),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           "images/flashsale_8.jpg",
//                           height: 120,
//                           width: 150,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 190,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "Ngự Dược Nhật Ký",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Sách Lịch Sử bán chạy của tháng",
//                             style: TextStyle(
//                               fontSize: 15,
//                               //fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           RatingBar.builder(
//                             initialRating: 4,
//                             minRating: 1,
//                             direction: Axis.horizontal,
//                             itemCount: 5,
//                             itemSize: 18,
//                             itemPadding: EdgeInsets.symmetric(horizontal: 4),
//                             itemBuilder: (context, _) => Icon(
//                               Icons.star,
//                               color: Colors.red,
//                             ),
//                             onRatingUpdate: (index) {},
//                           ),
//                           Text(
//                             "\160.800đ",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(
//                             Icons.favorite_border,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                           Icon(
//                             CupertinoIcons.cart,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//               //Single Item_6
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 width: 380,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 3,
//                         blurRadius: 10,
//                         offset: Offset(0, 3),
//                       ),
//                     ]),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           "images/flashsale_9.jpg",
//                           height: 120,
//                           width: 150,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 190,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "Essential Test For IELTS (+CD)",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Sách Luyện Thi IELTS bán chạy của tháng",
//                             style: TextStyle(
//                               fontSize: 15,
//                               //fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           RatingBar.builder(
//                             initialRating: 4,
//                             minRating: 1,
//                             direction: Axis.horizontal,
//                             itemCount: 5,
//                             itemSize: 18,
//                             itemPadding: EdgeInsets.symmetric(horizontal: 4),
//                             itemBuilder: (context, _) => Icon(
//                               Icons.star,
//                               color: Colors.red,
//                             ),
//                             onRatingUpdate: (index) {},
//                           ),
//                           Text(
//                             "\276.640đ",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(
//                             Icons.favorite_border,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                           Icon(
//                             CupertinoIcons.cart,
//                             color: Colors.red,
//                             size: 26,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
