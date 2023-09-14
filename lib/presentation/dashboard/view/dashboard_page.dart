import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/presentation/dashboard/view/dashboard_view.dart';

@RoutePage()
@immutable
final class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}
