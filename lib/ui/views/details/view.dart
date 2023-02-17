import 'package:flutter/material.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/ui/widgets/app_appbar.dart';
import 'package:mobile_assessment/ui/widgets/name_avatar.dart';

class DetailsView extends StatefulWidget {
  final Employee employee;
  const DetailsView({Key? key, required this.employee}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IAppBar(
        title: "Employee Details",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  NameAvatar(
                      radius: 50,
                      firstName: widget.employee.fullName,
                      lastName: widget.employee.fullName),
                  const SizedBox(height: 16),
                  Text(widget.employee.fullName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: const Text("Designation"),
              subtitle: Text(widget.employee.designation!),
            ),
            const Divider(),
            ListTile(
              title: const Text("Productivity Score"),
              trailing: CircleAvatar(
                  radius: 45,
                  backgroundColor:
                      _getStatusColor(widget.employee.productivityScore!),
                  child: Text("${widget.employee.productivityScore!.toInt()}",
                      style: TextStyle(
                        color: _getOnstatusColor(
                            widget.employee.productivityScore!),
                        fontWeight: FontWeight.w600,
                      ))),
            ),
            const Divider(),
            ListTile(
              title: const Text("Level"),
              subtitle: Text("${widget.employee.level!}"),
            ),
            const Divider(),
            ListTile(
              title: const Text("Current Salary"),
              subtitle: Text("NGN ${widget.employee.currentSalary!}"),
            ),
            const Divider(),
            ListTile(
              title: const Text("Employment Status"),
              subtitle: Text(
                  "${_getStatus(widget.employee.productivityScore!)}",
                  style: TextStyle(
                    color: _getStatusColor(widget.employee.productivityScore!),
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _getStatus(double score) {
    if (score < 40) {
      return "Terminated";
    } else if (score >= 40 && score < 49) {
      return "Demoted";
    } else if (score >= 50 && score < 79) {
      return "No change";
    } else {
      return "Promoted";
    }
  }

  _getStatusColor(double score) {
    if (score < 40) {
      return Colors.red;
    } else if (score >= 40 && score < 49) {
      return Colors.orange;
    } else if (score >= 50 && score < 79) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  _getOnstatusColor(double d) {
    if (d < 40) {
      return Colors.white;
    } else if (d >= 40 && d < 49) {
      return Colors.white;
    } else if (d >= 50 && d < 79) {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }
}
