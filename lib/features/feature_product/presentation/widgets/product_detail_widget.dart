import 'package:b2b_customer/common/widgets/row_text_builder.dart';
import 'package:b2b_customer/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../common/widgets/add_to_basket_widget.dart';
import '../../../../common/widgets/rich_text_builder.dart';
import '../../data/model/product.dart';
import '../cubit/product_cubit.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRichText("نام کالا", product.name, context, fontSize: 16),
                const SizedBox(height: 10),
                buildRichText(
                    "تعداد در بسته", product.mShomaresh.toString(), context,
                    fontSize: 16),
                const SizedBox(height: 10),
                buildRichText("واحد سنجش", product.vahedAsli.toString(), context,
                    fontSize: 16),
                const SizedBox(height: 10),
                buildRowText("قیمت واحد",
                    "${product.priceForoosh.toString().seRagham()}", context,
                    fontSize: 16),
              ],
            ),
          ),
        )),
        Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddToBasketDialog(
                      product: product,
                    );
                  },
                ).then((value) =>
                    BlocProvider.of<ProductCubit>(context)
                        .reloadBasketBudge());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                fixedSize: const Size(double.infinity, 50),
                primary: AppColors.yadegar_1,
              ),
              child: const Center(
                  child: Text(
                'افزودن به سبد خرید',
                style: TextStyle(
                    fontFamily: 'Estedad',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ))),
        )
      ],
    );
  }
}
