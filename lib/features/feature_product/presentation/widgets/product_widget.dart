import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/product_detail_widget.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/product_picture_widget.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check screen width
        double screenWidth = constraints.maxWidth;

        if (screenWidth > 800) {
          // Wide screen layout (left and right)
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: ProductPictureWidget(
                      imageUrl: product.getImageUrl(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: AppColors.appGrey,
                  child: ProductDetailWidget(
                    product: product,
                  ),
                ),
              ),
            ],
          );
        } else {
          // Narrow screen layout (top and bottom)
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: ProductPictureWidget(
                      imageUrl: product.getImageUrl(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: AppColors.appGrey,
                  child: ProductDetailWidget(
                    product: product,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
