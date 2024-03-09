extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}
