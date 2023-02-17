import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String? errorCode;
  final String? message;

  const CustomError({this.errorCode, this.message});

  factory CustomError.fromMap(Map<String, dynamic> data) => CustomError(
        errorCode: data['errorCode'] as String?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'errorCode': errorCode,
        'message': message,
      };

  factory CustomError.fromJson(String data) {
    return CustomError.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  CustomError copyWith({
    String? errorCode,
    String? message,
  }) {
    return CustomError(
      errorCode: errorCode ?? this.errorCode,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [errorCode, message];
}
