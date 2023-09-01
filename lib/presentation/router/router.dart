import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marlo/logic/filter/filter_cubit.dart';
import 'package:marlo/presentation/screens/dash_bord_section/dash_bord_page.dart';
import 'package:marlo/presentation/screens/transaction_section/transaction_page.dart';

class AppRouter {
  Route onGenerateRote(RouteSettings routeSettings) {
    MoneyFilter moneyFilter = MoneyFilter();
    StatusFilter statusFilter=StatusFilter();
    DateFilter dateFilter=DateFilter();
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const DashBordPage(),
        );
      case 'Transaction':
        return MaterialPageRoute(
          builder: (_) =>  MultiBlocProvider(
            providers: [
              BlocProvider.value(value: moneyFilter),
               BlocProvider.value(value: statusFilter),
               BlocProvider.value(value: dateFilter)
            ],
            child:const TransactionPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
    }
  }
}
