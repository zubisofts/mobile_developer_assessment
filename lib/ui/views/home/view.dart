import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_assessment/cubits/employee/employee_cubit.dart';
import 'package:mobile_assessment/repository/employee_repository.dart';
import 'package:mobile_assessment/ui/views/home/widgets/employee_tile.dart';
import 'package:mobile_assessment/ui/widgets/app_appbar.dart';
import 'package:mobile_assessment/ui/widgets/app_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final EmployeeCubit _employeeCubit = EmployeeCubit(EmployeeRepository());

  @override
  void initState() {
    super.initState();
    _employeeCubit.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IAppBar(
        title: "XYZ Employees",
        actions: [
          // Fake Error
          IconButton(
              tooltip: "Fake error",
              onPressed: () {
                _employeeCubit.syncEmployeesList(fakeError: true);
              },
              icon: const Icon(Icons.error_outline)),

          // Sync
          IconButton(
              tooltip: "Sync",
              onPressed: () {
                _employeeCubit.syncEmployeesList();
              },
              icon: const Icon(Icons.sync)),

          // Sort
          BlocBuilder<EmployeeCubit, EmployeeState>(
            bloc: _employeeCubit,
            builder: (context, state) {
              if (state is EmployeesFetched) {
                return PopupMenuButton<String>(
                  tooltip: "Sort",
                  icon: const Icon(
                    Icons.sort_by_alpha_outlined,
                  ),
                  onSelected: (sortBy) {
                    _employeeCubit.sortEmployees(sortBy);
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                        value: "name", child: Text("Sort by name")),
                    const PopupMenuItem(
                        value: "designation",
                        child: Text("Sort by designation")),
                    const PopupMenuItem(
                        value: "level", child: Text("Sort by level")),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => _employeeCubit,
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is EmployeesFetched) {
              return ListView.separated(
                itemCount: state.employees.length,
                itemBuilder: (context, index) {
                  return EmployeeTile(
                      onTap: (employee) {
                        // Navigate to details view
                        GoRouter.of(context)
                            .goNamed("details", extra: employee);
                      },
                      employee: state.employees[index]);
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }
            if (state is Error) {
              return ErrorContainer(errorMessages: state.errorMessages);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class ErrorContainer extends StatelessWidget {
  final List<String> errorMessages;
  const ErrorContainer({
    super.key,
    required this.errorMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Oops! 😩",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              ...errorMessages.map(
                (message) => Text(
                  message,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                  isPrimary: true,
                  onTap: () {
                    context.read<EmployeeCubit>().fetchEmployees();
                  },
                  buttonText: "Retry"),
            ],
          ),
        ),
      ],
    );
  }
}
