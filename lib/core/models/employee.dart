import 'dart:convert';

import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? designation;
  final int? level;
  final double? productivityScore;
  final String? currentSalary;
  final int? employmentStatus;

  const Employee({
    this.id,
    this.firstName,
    this.lastName,
    this.designation,
    this.level,
    this.productivityScore,
    this.currentSalary,
    this.employmentStatus,
  });

  factory Employee.fromMap(Map<String, dynamic> data) => Employee(
        id: data['id'] as int?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        designation: data['designation'] as String?,
        level: data['level'] as int?,
        productivityScore: data['productivity_score'] as double?,
        currentSalary: data['current_salary'] as String?,
        employmentStatus: data['employment_status'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'designation': designation,
        'level': level,
        'productivity_score': productivityScore,
        'current_salary': currentSalary,
        'employment_status': employmentStatus,
      };

  factory Employee.fromJson(String data) {
    return Employee.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  Employee copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? designation,
    int? level,
    double? productivityScore,
    String? currentSalary,
    int? employmentStatus,
  }) {
    return Employee(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      designation: designation ?? this.designation,
      level: level ?? this.level,
      productivityScore: productivityScore ?? this.productivityScore,
      currentSalary: currentSalary ?? this.currentSalary,
      employmentStatus: employmentStatus ?? this.employmentStatus,
    );
  }

  String get fullName => '$firstName $lastName';

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      designation,
      level,
      productivityScore,
      currentSalary,
      employmentStatus,
    ];
  }
}
