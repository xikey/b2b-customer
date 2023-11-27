import 'dart:convert';

class Personnel {
  String? code;
  String? name;
  String? token;
  bool? isAdmin;

  Personnel({
    this.code,
    this.name,
    this.token,
    this.isAdmin,
  });

  factory Personnel.fromJson(String data) =>
      Personnel.fromMap(json.decode(data));

  factory Personnel.fromMap(Map<String, dynamic> data) {
    return Personnel(
      code: data['code'] as String?,
      name: data['name'] as String?,
      token: data['token'] as String?,
      isAdmin: data['isAdmin'] as bool?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'token': token,
      'isAdmin': isAdmin,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Personnel(code: $code, name: $name, token: $token, isAdmin: $isAdmin)';
  }
}
