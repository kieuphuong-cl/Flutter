import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  //const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(children: [
          //for(int i=0; i <5; i++)
          //Single Item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Image.asset(
                "images/icon_book.jpg",
                width: 50,
                height: 50,
              ),
            ),
          ),

          //Single Item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Image.asset(
                "images/icon_pen.jpg",
                width: 50,
                height: 50,
              ),
            ),
          ),

          //Single Item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Image.asset(
                "images/icon_machine.png",
                width: 50,
                height: 50,
              ),
            ),
          ),

          //Single Item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Image.asset(
                "images/icon_play.jpg",
                width: 50,
                height: 50,
              ),
            ),
          ),

          //Single Item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Image.asset(
                "images/icon_paper.png",
                width: 50,
                height: 50,
              ),
            ),
          ),

          //Single Item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Image.asset(
                "images/icon_balo.png",
                width: 50,
                height: 50,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
