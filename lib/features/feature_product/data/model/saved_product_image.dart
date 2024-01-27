
class SavedProductImage {
  int id;

  SavedProductImage({
    required this.id,
  });

  factory SavedProductImage.fromJson(Map<String, dynamic> json) {
    return SavedProductImage(
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    return data;
  }

  @override
  String toString() {
    return 'Product{id: $id}';
  }
}
