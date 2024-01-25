class AdvertisePosition {
  static const List<String> positions = ["top", "middle", "button"];
  static const List<String> persianPositions = [
    "بالای صفحه",
    "وسط صفحه",
    "پایین صفحه"
  ];

  static String getPersianName(String position) {
    if (position == positions[0]) {
      return persianPositions[0];
    }

    if (position == positions[1]) {
      return persianPositions[1];
    }

    if (position == positions[2]) {
      return persianPositions[2];
    }
    return "نامشخص";
  }

  static String getEnglishName(String position) {
    if (position == persianPositions[0]) {
      return positions[0];
    }

    if (position == persianPositions[1]) {
      return positions[1];
    }

    if (position == persianPositions[2]) {
      return positions[2];
    }
    return "unknown";
  }
}
