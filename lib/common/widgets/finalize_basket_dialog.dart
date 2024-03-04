import 'package:b2b_customer/common/utils/logger.dart';
import 'package:b2b_customer/common/utils/toasty.dart';
import 'package:b2b_customer/features/feature_product/data/model/payment_type.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../params/result/finalize_basket_dialog_result.dart';
import '../resources/data_state.dart';
import 'dot_loading_widget.dart';
import 'drop_down_text_field_widget.dart';

class FinalizeBasketDialog extends StatelessWidget {
  const FinalizeBasketDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).getPaymentTypes();
    List<PaymentType> list = [];
    PaymentType? selectedPaymentType = null;
    final TextEditingController _commentsController = TextEditingController();

    return AlertDialog(
      title: const Text("ثبت نهایی سفارش شما"),
      content: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<ProductCubit, ProductState>(
              buildWhen: (previous, current) =>
                  current.productStatus is GetPaymentTypesStatus,
              listenWhen: (previous, current) =>
                  current.productStatus is GetPaymentTypesStatus,
              listener: (context, state) {
                if (state.productStatus is GetPaymentTypesStatus) {
                  final status = state.productStatus as GetPaymentTypesStatus;

                  if (status.dataState is DataSuccess<List<PaymentType>>) {
                    ZikeyLogger.showLog(
                        "DATA STATE", status.dataState.data.toString());
                    if (status.dataState.data == null ||
                        status.dataState.data!.isEmpty) {
                      ZikeyToast().showSnackBarError(
                          context, "خطا در دریافت اطلاعات نحوه های پرداخت");
                      Navigator.of(context).pop();
                    }
                    list = status.dataState.data!;
                  }
                }
              },
              builder: (context, state) {
                if (state.productStatus is LoadingStatus) {
                  return const DotLoadingWidget(size: 40);
                }

                if (list.isNotEmpty) {
                  return Container(
                    child: DropDownTextFieldWidget(
                      list: list.map((e) => e.name).toList(),
                      label: 'نحوه پرداخت',
                      onItemSelected: (text) {
                        if (text != null) {
                          selectedPaymentType = list
                              .firstWhere((element) => element.name == text);
                        }
                      },
                    ),
                  );
                }

                return (const SizedBox());
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              maxLines: 3,
              keyboardType: TextInputType.number,
              controller: _commentsController,
              decoration: InputDecoration(
                hintTextDirection: TextDirection.rtl,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusColor: Colors.white,
                labelText: 'توضیحات',
              ),
            ),
          ],
        ),
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
            if (selectedPaymentType == null) {
              ZikeyToast().showSnackBarInfo(
                  context, "ابتدا نحوه پرداخت را مشخص نمایید");
              return;
            }
            Navigator.of(context).pop(FinalizeBasketDialogResult(
                paymentType: selectedPaymentType!,
                comment: _commentsController.value.text));
          },
          child: const Text('ذخیره'),
        ),
      ],
    );
  }
}
