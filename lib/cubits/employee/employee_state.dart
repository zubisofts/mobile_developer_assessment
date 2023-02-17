part of 'employee_cubit.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class Loading extends EmployeeState {}

class Error extends EmployeeState {
  final List<String> errorMessages;

  const Error({required this.errorMessages});

  @override
  List<Object> get props => [errorMessages];
}

class EmployeesFetched extends EmployeeState {
  final List<Employee> employees;

  const EmployeesFetched({required this.employees});

  EmployeesFetched copyWith({List<Employee>? employees}) {
    return EmployeesFetched(employees: employees ?? this.employees);
  }

  @override
  List<Object> get props => [employees];
}
