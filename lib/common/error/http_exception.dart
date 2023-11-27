class HttpExceptionData {
  int statusCode;
  String message;
  DateTime timestamp;
  String path;

  HttpExceptionData({
    required this.statusCode,
    required this.message,
    required this.timestamp,
    required this.path,
  });

  factory HttpExceptionData.fromJson(Map<String, dynamic> json) {
    try{
      return HttpExceptionData(
        statusCode: json['statusCode'] as int,
        message: json['message'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        path: json['path'] as String,
      );
    }catch(error){
      return HttpExceptionData(
        statusCode: 10,
        message: "متاسفانه خطایی هنگام دریافت اطلاعات ب وجود آمده است",
        timestamp: DateTime.parse(json['timestamp'] as String),
        path: "",
      );
    }

  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'path': path,
    };
  }
}