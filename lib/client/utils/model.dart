abstract interface class CookieModel<T> {
  const CookieModel();

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
