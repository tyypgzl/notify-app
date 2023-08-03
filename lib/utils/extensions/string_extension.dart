extension StringExtension on String {
  bool isEqual(String string) => toLowerCase().contains(string.toLowerCase());

  String get capitalize =>
      (length > 1) ? this[0].toUpperCase() + substring(1) : toUpperCase();

  String lastChars(int n) => substring(length - n);

  String get urlFormatter {
    const reg = '[^A-Za-z]';
    final regExp = RegExp(reg);
    final name = split(' ').join().toLowerCase();
    return name.replaceAll(regExp, '');
  }

  String get addHttps {
    const https = 'https://';
    if (contains(https)) {
      return this;
    } else {
      final buffer = StringBuffer()
        ..write(https)
        ..write(this);
      return buffer.toString();
    }
  }

  String internationalizeAndUpperCase() {
    return replaceAll('ı', 'i')
        .replaceAll('ö', 'o')
        .replaceAll('ü', 'u')
        .replaceAll('ş', 's')
        .replaceAll('ğ', 'g')
        .replaceAll('ç', 'c')
        .replaceAll('Ü', 'U')
        .replaceAll('İ', 'I')
        .replaceAll('Ö', 'O')
        .replaceAll('Ü', 'U')
        .replaceAll('Ş', 'S')
        .replaceAll('Ğ', 'G')
        .replaceAll('Ç', 'C')
        .toUpperCase();
  }
}
