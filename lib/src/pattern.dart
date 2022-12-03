import 'extensions.dart';

class Pattern extends Object with Comparable<Pattern> {
  Pattern._(
    this._pattern,
    this._levels,
  );

  factory Pattern.from(String pattern) {
    final levels = <int?>[];
    final result = StringBuffer();

    bool waitDigit = true;
    for (int i = 0; i < pattern.length; i++) {
      final c = pattern[i];

      if (c.isDigit) {
        levels.add(c.asInt);
        waitDigit = false;
      } else {
        if (waitDigit) levels.add(0);
        result.write(c);
        waitDigit = true;
      }
    }

    if (waitDigit) levels.add(0);

    return Pattern._(
      result.toString(),
      levels,
    );
  }

  Pattern(this._pattern)
      : assert(_pattern != null),
        _levels = const [];

  final String _pattern;
  final List<int?> _levels;

  int get levelsCount => _levels.length;

  int? levelByIndex(int index) => _levels[index];

  @override
  String toString() => 'Pattern{'
      'pattern: $_pattern, '
      'levels: $_levels'
      '}';

  @override
  int compareTo(Pattern other) {
    bool first = _pattern.length < other._pattern.length;
    int minSize = first ? _pattern.length : other._pattern.length;

    for (var i = 0; i < minSize; ++i) {
      final res = _pattern[i].compareTo(other._pattern[i]);
      if (res != 0) return res;
    }
    return first ? -1 : 1;
  }
}
