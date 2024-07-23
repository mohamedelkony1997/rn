

import 'package:equatable/equatable.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class FetchEmployees extends EmployeeEvent {}

class FetchEmployee extends EmployeeEvent {
  final int id;

  const FetchEmployee(this.id);

  @override
  List<Object> get props => [id];
}
