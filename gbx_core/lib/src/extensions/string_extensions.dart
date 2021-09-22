extension StringHelper on String {
  String get initials {
    var names = split(" ");
    if (names.isEmpty) return "";
    if (names.length == 1) return names[0][0].toUpperCase();
    return "${names.first[0]}${names.last[0]}".toUpperCase();
  }
}
