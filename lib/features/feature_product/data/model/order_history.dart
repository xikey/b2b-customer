import 'package:meta/meta.dart';

class OrderHistory {
  final int sefaresh_ID;
  final String order_date;
  final int vaziat;
  final String order_time;
  final String sharhNahveh;
  final double rJamKol;
  final String tozihat;

  OrderHistory({
    required this.sefaresh_ID,
    required this.order_date,
    required this.vaziat,
    required this.order_time,
    required this.sharhNahveh,
    required this.rJamKol,
    required this.tozihat,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      sefaresh_ID: json['sefaresh_ID'] as int,
      order_date: json['order_date'] as String,
      vaziat: json['Vaziat'] as int,
      order_time: json['order_time'] as String,
      sharhNahveh: json['Sharh_Nahveh'] as String,
      rJamKol: json['R_JAM_KOL'] as double,
      tozihat: json['Tozihat'] as String,
    );
  }

  static List<OrderHistory> fromList(List<dynamic> dataList) {
    return dataList.map((data) => OrderHistory.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'sefaresh_ID': sefaresh_ID,
      'order_date': order_date,
      'Vaziat': vaziat,
      'order_time': order_time,
      'Sharh_Nahveh': sharhNahveh,
      'R_JAM_KOL': rJamKol,
      'Tozihat': tozihat,
    };
  }

  @override
  String toString() {
    return 'OrderHistory{sefaresh_ID: $sefaresh_ID, order_date: $order_date, Vaziat: $vaziat, order_time: $order_time, Sharh_Nahveh: $sharhNahveh, R_JAM_KOL: $rJamKol, Tozihat: $tozihat}';
  }
}