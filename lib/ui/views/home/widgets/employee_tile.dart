import 'package:flutter/material.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/ui/widgets/name_avatar.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;
  final Function(dynamic employee) onTap;
  const EmployeeTile({
    super.key,
    required this.employee,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(employee),
      leading:
          NameAvatar(firstName: employee.fullName, lastName: employee.fullName),
      title: Text(employee.fullName),
      subtitle: Text(employee.designation!),
      trailing: Text("${employee.level}"),
    );
  }
}
