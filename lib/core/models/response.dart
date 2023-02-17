import 'package:mobile_assessment/core/models/custom_error.dart';

class StatusResponse<T> {
  final bool success;
  final String message;
  final List<CustomError>? errors;
  final T? data;

  StatusResponse(
      {this.success = false,
      this.message = '',
      this.errors,
      this.data});

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(
        success: json['status'],
         message: json['message'], 
        errors: json['errors'] != null
            ? (json['errors'] as List)
                .map((e) => CustomError.fromMap(e))
                .toList()
            : null,
         data: json['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      "status": success,
      "message": message,
      "errors": errors,
      "data": data
    };
  }
}
