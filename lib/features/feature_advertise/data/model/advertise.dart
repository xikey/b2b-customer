import '../../../../config/constants.dart';

class Advertise {
  int id;
  String name;
  bool isActive;
  String url;
  String position;

  Advertise({
    required this.id,
    required this.name,
    required this.isActive,
    required this.url,
    required this.position,
  });

  factory Advertise.fromJson(Map<String, dynamic> data) {
    return Advertise(
      id: data['id'] as int,
      name: data['name'] as String,
      isActive: data['isActive'] as bool,
      url: data['url'] as String,
      position: data['position'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isActive': isActive,
      'url': url,
      'position': position,
    };
  }

  static List<Advertise> fromList(List<dynamic> dataList) {
    final list = dataList.map((data) => Advertise.fromJson(data)).toList();
    return list;
  }

  @override
  String toString() {
    return 'Advertise(id: $id, name: $name, isActive: $isActive, url: $url, position: $position)';
  }

  String getImageUrl() {
    return '${Constants.baseUrl}/images/advertise/$id.jpg';
  }
}