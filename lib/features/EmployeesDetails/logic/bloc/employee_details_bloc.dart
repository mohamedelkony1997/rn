
import 'package:bloc/bloc.dart';
import 'package:rn/core/networking/employeedetails_services.dart';
import 'package:rn/features/EmployeesDetails/logic/bloc/employee_details_event.dart';
import 'package:rn/features/EmployeesDetails/logic/bloc/employee_details_state.dart';



class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeDetailsServices employeeService;

  EmployeeBloc(this.employeeService) : super(EmployeeInitial()) {

    on<FetchEmployee>(_onFetchEmployee);
  }

 

  Future<void> _onFetchEmployee(FetchEmployee event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoading());
    try {
      final employee = await employeeService.fetchEmployee(event.id);
      emit(EmployeeLoaded(employee));
    } catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }
}