// ignore_for_file: unused_element

import 'package:flutter/material.dart';

final class AppPadding extends EdgeInsets {
  const AppPadding._() : super.all(0);

  const AppPadding.page() : super.symmetric(horizontal: 12);
  const AppPadding.sheet()
      : super.only(left: 16, right: 16, top: 12, bottom: 12);
  const AppPadding.zero() : super.all(0);

  const AppPadding.x4() : super.symmetric(horizontal: 4);
  const AppPadding.x8() : super.symmetric(horizontal: 8);
  const AppPadding.x12() : super.symmetric(horizontal: 12);
  const AppPadding.x16() : super.symmetric(horizontal: 16);

  const AppPadding.y4() : super.symmetric(vertical: 4);
  const AppPadding.y8() : super.symmetric(vertical: 8);
  const AppPadding.y12() : super.symmetric(vertical: 12);
  const AppPadding.y16() : super.symmetric(vertical: 16);

  const AppPadding.all4() : super.all(4);
  const AppPadding.all8() : super.all(8);
  const AppPadding.all12() : super.all(12);
  const AppPadding.all16() : super.all(16);
}
