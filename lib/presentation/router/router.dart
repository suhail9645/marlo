import 'package:flutter/material.dart';
import 'package:marlo/presentation/screens/dash_bord_section/dash_bord_page.dart';
import 'package:marlo/presentation/screens/transaction_section/transaction_page.dart';

class AppRouter {
  Route onGenerateRote(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const DashBordPage(),
        );
          case 'Transaction':
        return MaterialPageRoute(
          builder: (_) => const TransactionPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
    }
  }
}
