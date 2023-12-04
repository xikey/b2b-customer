import 'package:flutter/material.dart';

class CategoryTagsWidget extends StatelessWidget {
  const CategoryTagsWidget({Key? key, required this.count}) : super(key: key);

  final int count;
  final double itemHeight = 100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        int allItems=count>8?8:count;
        int widthParts=constraints.maxWidth~/itemHeight;
        if(widthParts>allItems){
          widthParts=allItems;
        }


        return Container(
          height: itemHeight,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              widthParts,
              (index) {
                return Container(
                  height: itemHeight,
                  width: itemHeight,
                  color: Colors.white,
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
