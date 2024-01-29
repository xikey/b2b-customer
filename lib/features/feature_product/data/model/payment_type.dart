
class PaymentType {
  int code;
  String name;

  PaymentType({
    required this.code,
    required this.name,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) {
    return PaymentType(
      code: json['code'] as int,
      name: json['name'] as String,
    );
  }

  static List<PaymentType> fromList(List<dynamic> dataList) {
    return dataList.map((data) => PaymentType.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;

    return data;
  }

  @override
  String toString() {
    return 'PaymentType{code: $code, name: $name}';
  }
}
