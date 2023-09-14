// ignore_for_file: unused_element

import 'package:flutter/material.dart';

final class AppRadius extends BorderRadius {
  const AppRadius._() : super.all(Radius.zero);

  const AppRadius.general() : super.all(const Radius.circular(8));
}
