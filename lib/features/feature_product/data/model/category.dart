import '../../../../config/constants.dart';

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  static List<Category> fromList(List<dynamic> dataList) {
    return dataList.map((data) => Category.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }

  @override
  String toString() {
    return 'CreateNewCategory{productId: $id, name: $name,}';
  }

  String getImageUrl() {
    return '${Constants.baseUrl}/images/category/$id.jpg';
  }
}
