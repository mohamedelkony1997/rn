import 'package:equatable/equatable.dart';

abstract class EmployeeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchEmployees extends EmployeeEvent {}

class CreateEmployee extends EmployeeEvent {
  final Map<String, dynamic> employeeData;

  CreateEmployee(this.employeeData);

  @override
  List<Object> get props => [employeeData];
}
class UpdateEmployee extends EmployeeEvent {
  final int id;
  final Map<String, dynamic> employeeData;

  UpdateEmployee(this.id, this.employeeData);

  @override
  List<Object> get props => [id, employeeData];
}
class DeleteEmployee extends EmployeeEvent {
  final int id;

  DeleteEmployee(this.id);

  @override
  List<Object> get props => [id];
}