import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assessment/core/db/daos/employee_dao.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/repository/employee_repository.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final EmployeeRepository employeeRepository;
  EmployeeCubit(this.employeeRepository) : super(EmployeeInitial());

  void fetchEmployees() async {
    emit(Loading());
    // First check if data is already saved in local storage
    EmployeeDao employeeDao = EmployeeDao();
    var employeeList = await employeeDao.getAll();
    if (employeeList.isNotEmpty) {
      emit(EmployeesFetched(employees: employeeList));
      return;
    }

    // If the employee table is empty, the go ahead to fetch from api
    // Simulate delayed network call
    await Future.delayed(const Duration(seconds: 2));

    try {
      var response = await employeeRepository.getEmployees(fakeError: false);
      if (response.success) {
        var employeeList = response.data;
        emit(EmployeesFetched(employees: employeeList!));
        // Save it in local storage
        EmployeeDao employeeDao = EmployeeDao();
        employeeDao.insertAll(employeeList);
      } else {
        emit(Error(
            errorMessages: response.errors!.map((e) => e.message!).toList()));
      }
    } catch (e) {
      emit(const Error(
          errorMessages: ["An unkwnown error occurred, try again"]));
    }
  }

  void syncEmployeesList({bool fakeError = false}) async {
    emit(Loading());

    // If the employee table is empty, the go ahead to fetch from api
    // Simulate delayed network call
    await Future.delayed(const Duration(seconds: 2));

    try {
      var response =
          await employeeRepository.getEmployees(fakeError: fakeError);
      if (response.success) {
        var employeeList = response.data;
        emit(EmployeesFetched(employees: employeeList!));
        // Update the local storage
        // Primarily the local data is been overwritten
        // with the current value
        EmployeeDao employeeDao = EmployeeDao();
        employeeDao.insertAll(employeeList);
      } else {
        emit(Error(
            errorMessages: response.errors!.map((e) => e.message!).toList()));
      }
    } catch (e) {
      log(e.toString());
      emit(const Error(
          errorMessages: ["An unknown error occurred, try again."]));
    }
  }

  void sortEmployees(String sortBy) {
    if (state is EmployeesFetched) {
      log("messageL: $sortBy");
      var employeeList = (state as EmployeesFetched).employees;
      switch (sortBy) {
        case "name":
          employeeList.sort((a, b) => a.fullName.compareTo(b.fullName));
          break;
        case "designation":
          employeeList.sort((a, b) => a.designation!.compareTo(b.designation!));
          break;
        case "level":
          employeeList.sort((a, b) => a.fullName.compareTo(b.fullName));
          employeeList.sort((a, b) => a.level!.compareTo(b.level!));
          employeeList = List.from(employeeList.reversed);
          break;
      }
      emit(EmployeeInitial());
      emit(EmployeesFetched(employees: employeeList));
    }
  }
}
