extension StringExtension on String? {
  String orNull({String defaultValue = ""}) {
    if (this == null) {
      return defaultValue;
    } else {
      return this!;
    }
  }
}
