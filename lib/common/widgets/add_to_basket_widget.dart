import 'package:b2b_customer/common/utils/basket.dart';
import 'package:b2b_customer/common/utils/toasty.dart';
import 'package:b2b_customer/common/widgets/rich_text_builder.dart';
import 'package:b2b_customer/features/feature_product/data/model/ordered_product.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class AddToBasketDialog extends StatefulWidget {
  const AddToBasketDialog({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<AddToBasketDialog> createState() => _AddToBasketDialogState();
}

class _AddToBasketDialogState extends State<AddToBasketDialog> {
  final TextEditingController _countController = TextEditingController();
  final TextEditingController _packController = TextEditingController();

  double count = 0;
  int pack = 0;
  double totalCount = 0;
  int price = 0;

  @override
  Widget build(BuildContext context) {
    void calculator() {
      try {
        double countPerPack = widget.product.mShomaresh!;
        int fi = widget.product.priceForoosh!;
        setState(() {
          totalCount = (pack * countPerPack) + count;
          price = (totalCount * fi).toInt();
        });
      } catch (e) {}
    }

    return AlertDialog(
      title: const Text('افزودن به سبد خرید'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichText("نام کالا", widget.product.name, context),
          const SizedBox(height: 5),
          buildRichText(
              "تعداد در بسته", widget.product.mShomaresh.toString(), context),
          const SizedBox(height: 5),
          buildRichText(
              "واحد سنجش", widget.product.vahedAsli.toString(), context),
          const SizedBox(height: 5),
          buildRichText(
              "قیمت واحد",
              "${widget.product.priceForoosh.toString().seRagham()} ریال",
              context),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _packController,
            onChanged: (text) {
              try {
                setState(() {
                  if (text.isEmpty) {
                    pack = 0;
                  } else {
                    pack = int.parse(text);
                  }
                });
              } catch (e) {}
              calculator();
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintTextDirection: TextDirection.rtl,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusColor: Colors.white,
              labelText: 'بسته',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              try {
                setState(() {
                  if (text.isEmpty) {
                    count = 0;
                  } else {
                    count = double.parse(text);
                  }
                });
              } catch (e) {}
              calculator();
            },
            controller: _countController,
            decoration: InputDecoration(
              hintTextDirection: TextDirection.rtl,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusColor: Colors.white,
              labelText: 'عدد/فله',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
              child: buildRichText("مقدار نهایی",
                  "$totalCount ${widget.product.vahedAsli}", context),
            ),
          ),
          Container(
              child: Center(
                  child: buildRichText("مبلغ نهایی",
                      "${price.toString().seRagham()} ریال", context))),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without a result
          },
          child: const Text('انصراف'),
        ),
        TextButton(
          onPressed: () {
            if (totalCount <= 0) {
              ZikeyToast().showSnackBarError(context, "مقادیر نادرست میباشند");
            } else {
              locator<Basket>().addOrderedProduct(OrderedProduct(
                  productCode: widget.product.code, orderCount: totalCount));
            }

            //Navigator.of(context).pop(_inputController.text);
          },
          child: const Text('ذخیره'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _countController.dispose();
    _packController.dispose();
    super.dispose();
  }
}
