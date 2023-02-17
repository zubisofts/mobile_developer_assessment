import 'package:mobile_assessment/core/helpers/api/data.dart';
import 'package:mobile_assessment/core/models/custom_error.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/core/models/response.dart';

class EmployeeRepository {
  /// This function returns a list of employees.
  /// Note: We assume this is a real network api call
  Future<StatusResponse<List<Employee>>> getEmployees(
      {required bool fakeError}) async {
    try {
      var responseData = fakeError ? Api.errorRexponse : Api.successResponse;
      if (responseData["statusCode"] == 200) {
        return StatusResponse(
            success: true,
            message: responseData["message"],
            data: List<Employee>.from(
                responseData["data"].map((e) => Employee.fromMap(e))));
      } else {
        return StatusResponse(
            success: false,
            message: responseData["message"],
            errors: List<CustomError>.from(
                responseData["errors"].map((e) => CustomError.fromMap(e))));
      }
    } catch (e) {
      rethrow;
    }
  }
}
