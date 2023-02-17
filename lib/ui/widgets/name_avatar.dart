import 'package:flutter/material.dart';

class NameAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double? radius;
  const NameAvatar({
    super.key,
    required this.firstName,
    required this.lastName,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Text(_getInitials(firstName, lastName),
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
    );
  }

  String _getInitials(String firstName, String lastName) {
    return "${firstName[0]}${lastName[0]}";
  }
}
