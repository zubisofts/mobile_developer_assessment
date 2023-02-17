import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/ui/views/details/view.dart';
import 'package:mobile_assessment/ui/views/home/view.dart';

final GoRouter routes = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage(
          key: state.pageKey,
          child: const HomeView(),
        );
      },
      routes: [
        GoRoute(
          path: 'details',
          name: "details",
          pageBuilder: (BuildContext context, GoRouterState state) {
            Employee employee = state.extra as Employee;
            return MaterialPage(
              key: state.pageKey,
              child: DetailsView(employee: employee),
            );
          },
        ),
      ],
    ),
  ],
);
