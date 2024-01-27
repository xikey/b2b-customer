import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/zikey_image_view.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem(
      {Key? key,
      required this.width,
      required this.product,
      required this.onTap,
        required this.addToBasket})
      : super(key: key);

  final double width;

  final Product product;
  final Function() onTap;
  final Function() addToBasket;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Card(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: width,
                  height: width,
                  margin: const EdgeInsets.all(12),
                  child: Center(
                    child: ZikeyImageView(
                      borderRadius: 10,
                      imageUrl: product.getImageUrl(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  child: Center(
                      child: Text(
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.normal),
                    product.name,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 30,
                  child: Center(
                      child: Text(
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Estedad',
                        color: AppColors.yadegar_1),
                    "${product.priceForoosh.toString().seRagham()} ریال ",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                ),
                TextButton(
                  onPressed:addToBasket,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0), // Adjust padding as needed
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "افزودن به سبد",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
