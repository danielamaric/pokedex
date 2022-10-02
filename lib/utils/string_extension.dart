extension StringExtension on String {
  String get withoutLinebreaks {
    return replaceAll('\n', ' ').replaceAll('\f', ' ');
  }
}
