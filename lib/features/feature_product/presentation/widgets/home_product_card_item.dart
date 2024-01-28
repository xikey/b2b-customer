import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/zikey_image_view.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomeProductCardItem extends StatelessWidget {
  const HomeProductCardItem(
      {Key? key,
      required this.product,
      required this.onTap,
      required this.addToBasket,
      required this.height,
      required this.addColor})
      : super(key: key);

  final double height;
  final Color addColor;

  final Product product;
  final Function() onTap;
  final Function() addToBasket;

  @override
  Widget build(BuildContext context) {

    final width=height/2;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
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
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 25,
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
                  onPressed: addToBasket,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    // Adjust padding as needed
                    backgroundColor: addColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const SizedBox(
                    height: 40,
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
