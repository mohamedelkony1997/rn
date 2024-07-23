import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rn/core/networking/employeedetails_services.dart';
import 'package:rn/core/theming/colors.dart';
import 'package:rn/core/widgets/text_widget.dart';
import 'package:rn/features/EmployeesDetails/logic/bloc/employee_details_bloc.dart';
import 'package:rn/features/EmployeesDetails/logic/bloc/employee_details_event.dart';
import 'package:rn/features/EmployeesDetails/logic/bloc/employee_details_state.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final int employeeId;

  EmployeeDetailScreen({required this.employeeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(EmployeeDetailsServices())
        ..add(FetchEmployee(employeeId)),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: ColorsApp.mainblue,
            title: TextWidget(
                color: ColorsApp.mainwhite,
                text: "Employee Details",
                size: 22.0)),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EmployeeLoaded) {
              final employee = state.employeeResponse.data;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (employee.profileImage.isEmpty)
                        ? CircleAvatar(
                          maxRadius: 150,
                          child: Image.asset("assets/images/profile.png", height: 200,
                            width: 200,fit: BoxFit.cover,),)
                        : Image.network(
                            employee.profileImage,
                            height: 150,
                            width: 120,
                          ),
                    SizedBox(height: 30),
                    TextWidget(
                      text: 'Name: ${employee.employeeName}',
                      size: 26.0,
                       weight: FontWeight.bold
                    ),
                    SizedBox(height: 15),
                    TextWidget(
                      text: 'Age: ${employee.employeeAge}',
                      size: 22.0,
                  
                    ),
                    SizedBox(height: 15),
                    TextWidget(
                      text: 'Salary: \$${employee.employeeSalary}',
                      size: 22.0,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else if (state is EmployeeError) {
              return Center(child: Text(state.message));
            } else {
              return Center(
                child: TextWidget(
                  text: "Employee details not available",
                  size: 17.0,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
