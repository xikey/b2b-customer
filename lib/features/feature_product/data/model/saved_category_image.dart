
class SavedCategoryImage {
  int id;

  SavedCategoryImage({
    required this.id,
  });

  factory SavedCategoryImage.fromJson(Map<String, dynamic> json) {
    return SavedCategoryImage(
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
