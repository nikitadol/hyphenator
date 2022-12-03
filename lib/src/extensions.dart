extension StringIsDigit on String {
  bool get isDigit => double.tryParse(this) != null;
}

extension StringAsInt on String {
  int? get asInt => int.tryParse(this);
}

extension StringIsLetter on String {
  bool get isLetter {
    assert(this.length == 1);

    final c = this[0];

    return !(c == c.toLowerCase() && c == c.toUpperCase());
  }
}
