import '../../../features/feature_product/data/model/payment_type.dart';

class FinalizeBasketDialogResult {
  final PaymentType paymentType;
  final String? comment;

  FinalizeBasketDialogResult(
      {required this.paymentType, required this.comment});
}
