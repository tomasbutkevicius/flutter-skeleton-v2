import 'dart:math' show cos, sqrt, asin;

class CommonUtilities {
  static double? parseDouble(dynamic value) {
    return value is String
        ? double.tryParse(value)
        : value is double
            ? value
            : null;
  }

  static int? parseInt(dynamic value) {
    return value is String
        ? int.tryParse(value)
        : value is int
            ? value
            : null;
  }

  static String joinList(List<String?> list, {String separator = ' '}) {
    list.removeWhere((value) => value == null || value == '');
    return list.join(separator);
  }

  static double calculateDistanceInKm(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p) / 2 + cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static String cleanTextFromTags(String text) {
    text.replaceAll('</p>', '\n\n');
    text.replaceAll('</br>', '\n\n');

    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
