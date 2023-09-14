// ignore_for_file: unused_element

import 'package:flutter/material.dart';

final class AppPadding extends EdgeInsets {
  const AppPadding._() : super.all(0);

  const AppPadding.page() : super.symmetric(horizontal: 12);
  const AppPadding.zero() : super.all(0);

  const AppPadding.x4() : super.symmetric(horizontal: 4);
  const AppPadding.x8() : super.symmetric(horizontal: 8);

  const AppPadding.y4() : super.symmetric(horizontal: 4);
  const AppPadding.y8() : super.symmetric(horizontal: 8);

  const AppPadding.all4() : super.all(4);
  const AppPadding.all8() : super.all(8);
}
