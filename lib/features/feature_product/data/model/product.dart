
import '../../../../config/constants.dart';

class Product {
  int id;
  int code;
  String name;
  int? priceForoosh;
  int? priceForoosh2;
  int? priceForoosh3;
  int? priceForoosh4;
  int? priceForoosh5;
  int? priceFWithoutTax;
  int? priceF2WithoutTax;
  int? priceF3WithoutTax;
  int? priceF4WithoutTax;
  int? priceF5WithoutTax;
  int? goroohAsli;
  int? goroohFarei;
  String? nameGoroohAsli;
  String? nameGoroohFarei;
  String? vahedAsli;
  double? mShomaresh;
  String? barcode;
  bool? isJashvare;
  double? tabletTarget;
  int? moddat;
  int availability;
  double? takhfifPercent;
  String? vijegi1;
  String? vijegi2;
  String? vijegi3;
  String? vijegi4;
  String? vijegi5;
  String? vijegi6;
  String? vijegi7;
  String? vijegi8;
  String? vijegi9;
  String? vijegi10;

  Product({
    required this.id,
    required this.code,
    required this.name,
    required this.priceForoosh,
    required this.priceForoosh2,
    required this.priceForoosh3,
    required this.priceForoosh4,
    required this.priceForoosh5,
    required this.priceFWithoutTax,
    required this.priceF2WithoutTax,
    required this.priceF3WithoutTax,
    required this.priceF4WithoutTax,
    required this.priceF5WithoutTax,
    required this.goroohAsli,
    required this.goroohFarei,
    required this.nameGoroohAsli,
    required this.nameGoroohFarei,
    required this.vahedAsli,
    required this.mShomaresh,
    required this.barcode,
    required this.isJashvare,
    required this.tabletTarget,
    required this.moddat,
    required this.availability,
    required this.takhfifPercent,
    required this.vijegi1,
    required this.vijegi2,
    required this.vijegi3,
    required this.vijegi4,
    required this.vijegi5,
    required this.vijegi6,
    required this.vijegi7,
    required this.vijegi8,
    required this.vijegi9,
    required this.vijegi10,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      code: json['code'] as int,
      name: json['name'] as String,
      priceForoosh: json['priceForoosh'] as int?,
      priceForoosh2: json['priceForoosh2'] as int?,
      priceForoosh3: json['priceForoosh3'] as int?,
      priceForoosh4: json['priceForoosh4'] as int?,
      priceForoosh5: json['priceForoosh5'] as int?,
      priceFWithoutTax: json['priceFWithoutTax'] as int?,
      priceF2WithoutTax: json['priceF2WithoutTax'] as int?,
      priceF3WithoutTax: json['priceF3WithoutTax'] as int?,
      priceF4WithoutTax: json['priceF4WithoutTax'] as int?,
      priceF5WithoutTax: json['priceF5WithoutTax'] as int?,
      goroohAsli: json['goroohAsli'] as int?,
      goroohFarei: json['goroohFarei'] as int?,
      nameGoroohAsli: json['nameGoroohAsli'] as String?,
      nameGoroohFarei: json['nameGoroohFarei'] as String?,
      vahedAsli: json['vahedAsli'] as String?,
      mShomaresh: json['mShomaresh'] is int
          ? json['mShomaresh'].toDouble()
          : json['mShomaresh'],
      barcode: json['barcode'] as String?,
      isJashvare: json['isJashvare'] as bool?,
      tabletTarget: double.parse(json['tabletTarget'].toString()),
      moddat: json['moddat'] as int?,
      availability: json['availibility'] as int,
      takhfifPercent: json['takhfifPercent'] is int
          ? json['takhfifPercent'].toDouble()
          : json['takhfifPercent'],
      vijegi1: json['vijegi1'] as String?,
      vijegi2: json['vijegi2'] as String?,
      vijegi3: json['vijegi3'] as String?,
      vijegi4: json['vijegi4'] as String?,
      vijegi5: json['vijegi5'] as String?,
      vijegi6: json['vijegi6'] as String?,
      vijegi7: json['vijegi7'] as String?,
      vijegi8: json['vijegi8'] as String?,
      vijegi9: json['vijegi9'] as String?,
      vijegi10: json['vijegi10'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['priceForoosh'] = priceForoosh;
    data['priceForoosh2'] = priceForoosh2;
    data['priceForoosh3'] = priceForoosh3;
    data['priceForoosh4'] = priceForoosh4;
    data['priceForoosh5'] = priceForoosh5;
    data['priceFWithoutTax'] = priceFWithoutTax;
    data['priceF2WithoutTax'] = priceF2WithoutTax;
    data['priceF3WithoutTax'] = priceF3WithoutTax;
    data['priceF4WithoutTax'] = priceF4WithoutTax;
    data['priceF5WithoutTax'] = priceF5WithoutTax;
    data['goroohAsli'] = goroohAsli;
    data['goroohFarei'] = goroohFarei;
    data['nameGoroohAsli'] = nameGoroohAsli;
    data['nameGoroohFarei'] = nameGoroohFarei;
    data['vahedAsli'] = vahedAsli;
    data['mShomaresh'] = mShomaresh;
    data['barcode'] = barcode;
    data['isJashvare'] = isJashvare;
    data['tabletTarget'] = tabletTarget;
    data['moddat'] = moddat;
    data['availability'] = availability;
    data['takhfifPercent'] = takhfifPercent;
    data['vijegi1'] = vijegi1;
    data['vijegi2'] = vijegi2;
    data['vijegi3'] = vijegi3;
    data['vijegi4'] = vijegi4;
    data['vijegi5'] = vijegi5;
    data['vijegi6'] = vijegi6;
    data['vijegi7'] = vijegi7;
    data['vijegi8'] = vijegi8;
    data['vijegi9'] = vijegi9;
    data['vijegi10'] = vijegi10;
    return data;
  }

  static List<Product> fromList(List<dynamic> dataList) {
    return dataList.map((data) => Product.fromJson(data)).toList();
  }

  String getImageUrl() {
    return '${Constants.baseUrl}/images/products/$id.jpg';
  }

  @override
  String toString() {
    return 'Product{id: $id, code: $code, name: $name, priceForoosh: $priceForoosh, priceForoosh2: $priceForoosh2, priceForoosh3: $priceForoosh3, priceForoosh4: $priceForoosh4, priceForoosh5: $priceForoosh5, priceFWithoutTax: $priceFWithoutTax, priceF2WithoutTax: $priceF2WithoutTax, priceF3WithoutTax: $priceF3WithoutTax, priceF4WithoutTax: $priceF4WithoutTax, priceF5WithoutTax: $priceF5WithoutTax, goroohAsli: $goroohAsli, goroohFarei: $goroohFarei, nameGoroohAsli: $nameGoroohAsli, nameGoroohFarei: $nameGoroohFarei, vahedAsli: $vahedAsli, mShomaresh: $mShomaresh, barcode: $barcode, isJashvare: $isJashvare, tabletTarget: $tabletTarget, moddat: $moddat, availability: $availability, takhfifPercent: $takhfifPercent, vijegi1: $vijegi1, vijegi2: $vijegi2, vijegi3: $vijegi3, vijegi4: $vijegi4, vijegi5: $vijegi5, vijegi6: $vijegi6, vijegi7: $vijegi7, vijegi8: $vijegi8, vijegi9: $vijegi9, vijegi10: $vijegi10}';
  }
}
