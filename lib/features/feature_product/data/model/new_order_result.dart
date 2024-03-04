class NewOrderResult {
  int success;
  String error;

  NewOrderResult({
    required this.success,
    required this.error,
  });

  factory NewOrderResult.fromJson(Map<String, dynamic> json) {
    return NewOrderResult(
      success: json['success'] as int,
      error: json['error'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    return data;
  }

  @override
  String toString() {
    return 'NewOrderResult{success: $success, error: $error}';
  }
}