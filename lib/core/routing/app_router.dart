import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rn/core/routing/routes.dart';
import 'package:rn/features/Employees/logic/bloc/employees_bloc.dart';
import 'package:rn/features/Employees/logic/bloc/employees_event.dart';
import 'package:rn/features/Employees/ui/Employees.dart';
import 'package:rn/features/EmployeesDetails/ui/employees_details.dart';
import '../networking/employees_services.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSetting) {
    final arguments = routeSetting.arguments;
    switch (routeSetting.name) {
      case Routes.employees:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                EmployeeBloc(EmployeeService())..add(FetchEmployees()),
            child: Employees(),
          ),
        );
      case Routes.employeesDetails:
        final int employeeId = arguments as int;
        return MaterialPageRoute(
          builder: (context) => EmployeeDetailScreen(employeeId: employeeId),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No Route Defined For ${routeSetting.name}"),
            ),
          ),
        );
    }
  }
}
