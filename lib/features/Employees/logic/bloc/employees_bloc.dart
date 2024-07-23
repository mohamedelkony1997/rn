import 'package:bloc/bloc.dart';
import 'package:rn/core/networking/employees_services.dart';
import 'package:rn/features/Employees/logic/bloc/employees_event.dart';
import 'package:rn/features/Employees/logic/bloc/employees_state.dart';


class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeService employeeService;

  EmployeeBloc(this.employeeService) : super(EmployeeInitial()) {
    on<FetchEmployees>(_onFetchEmployees);
    on<CreateEmployee>(_onCreateEmployee);
    on<UpdateEmployee>(_onUpdateEmployee);
    on<DeleteEmployee>(_onDeleteEmployee);  
  }

  Future<void> _onFetchEmployees(FetchEmployees event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoading());
    try {
      final employees = await employeeService.fetchEmployees();
      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }

  Future<void> _onCreateEmployee(CreateEmployee event, Emitter<EmployeeState> emit) async {
    try {
      await employeeService.createEmployee(event.employeeData);
      final employees = await employeeService.fetchEmployees();
      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }

  Future<void> _onUpdateEmployee(UpdateEmployee event, Emitter<EmployeeState> emit) async {
    try {
      await employeeService.updateEmployee(event.id, event.employeeData);
      final employees = await employeeService.fetchEmployees();
      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }
    Future<void> _onDeleteEmployee(DeleteEmployee event, Emitter<EmployeeState> emit) async {
    try {
      await employeeService.deleteEmployee(event.id);
      final employees = await employeeService.fetchEmployees();
      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }
}
