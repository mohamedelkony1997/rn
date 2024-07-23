import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rn/features/Employees/data/employesata.dart';
import 'package:rn/features/Employees/logic/bloc/employees_bloc.dart';
import 'package:rn/features/Employees/logic/bloc/employees_event.dart';
import 'package:rn/core/routing/routes.dart';
import 'package:rn/core/theming/colors.dart';
import 'package:rn/core/widgets/text_widget.dart';
import 'package:rn/features/Employees/logic/bloc/employees_state.dart';

class Employees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.mainblue,
          title: TextWidget(
            color: ColorsApp.mainwhite,
            text: "Employee List",
            size: 22.0,
          ),
        ),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EmployeeLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.employeeResponse.data.length,
                  itemBuilder: (context, index) {
                    final employee = state.employeeResponse.data[index];
                    return Dismissible(
                      
                      key: Key(employee.id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        context.read<EmployeeBloc>().add(DeleteEmployee(employee.id));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 219, 219),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: employee.employeeName,
                                weight: FontWeight.bold,
                                size: 23.0,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () => _showEditEmployeeDialog(context, employee),
                                icon: Icon(Icons.edit),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              TextWidget(
                                text: 'Age: ${employee.employeeAge}, ',
                                size: 17.0,
                              ),
                              Spacer(),
                              TextWidget(
                                text: 'Salary: \$${employee.employeeSalary} ',
                                size: 17.0,
                                color: ColorsApp.maingreen,
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.employeesDetails,
                              arguments: employee.id,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is EmployeeError) {
              return Center(child: Text(state.message));
            } else {
              return Center(
                child: TextWidget(text: 'Press the button to fetch employees'),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateEmployeeDialog(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _showCreateEmployeeDialog(BuildContext context) {
    final _nameController = TextEditingController();
    final _salaryController = TextEditingController();
    final _ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Create New Employee'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final name = _nameController.text;
                final salary = int.tryParse(_salaryController.text) ?? 0;
                final age = int.tryParse(_ageController.text) ?? 0;

                context.read<EmployeeBloc>().add(CreateEmployee({
                      'name': name,
                      'salary': salary,
                      'age': age,
                      'profile_image': '',
                    }));

                Navigator.pop(dialogContext);
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

 void _showEditEmployeeDialog(BuildContext context, Employee employee) {
  final _nameController = TextEditingController(text: employee.employeeName);
  final _salaryController = TextEditingController(text: employee.employeeSalary.toString());
  final _ageController = TextEditingController(text: employee.employeeAge.toString());

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Edit Employee'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _salaryController,
              decoration: InputDecoration(labelText: 'Salary'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = _nameController.text;
              final salary = int.tryParse(_salaryController.text) ?? 0;
              final age = int.tryParse(_ageController.text) ?? 0;

              context.read<EmployeeBloc>().add(UpdateEmployee(employee.id, {
                    'name': name,
                    'salary': salary,
                    'age': age,
                    'profile_image': '',
                  }));

              Navigator.pop(dialogContext);
            },
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}
}
