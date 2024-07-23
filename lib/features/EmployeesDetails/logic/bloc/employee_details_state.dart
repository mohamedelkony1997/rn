
import 'package:equatable/equatable.dart';
import 'package:rn/features/EmployeesDetails/data/employedetailsdata.dart';


abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final EmployeeResponse employeeResponse;

  const EmployeeLoaded(this.employeeResponse);

  @override
  List<Object> get props => [employeeResponse];
}

class EmployeeError extends EmployeeState {
  final String message;

  const EmployeeError(this.message);

  @override
  List<Object> get props => [message];
}