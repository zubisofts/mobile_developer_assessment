import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assessment/core/models/custom_error.dart';
import 'package:mobile_assessment/core/models/response.dart';
import 'package:mobile_assessment/cubits/employee/employee_cubit.dart';
import 'package:mobile_assessment/repository/employee_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockChatRepository extends Mock implements EmployeeRepository {}

String table = "CREATE TABLE IF NOT EXISTS employees ("
    "id integer NOT NULL PRIMARY KEY AUTOINCREMENT,"
    "first_name varchar DEFAULT NULL,"
    "last_name varchar DEFAULT NULL,"
    "designation varchar DEFAULT NULL,"
    "level integer DEFAULT 0,"
    "productivity_score double DEFAULT 0,"
    "current_salary varchar DEFAULT NULL,"
    "employment_status integer DEFAULT NULL)";

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late final EmployeeRepository employeeRepo;
  late final EmployeeCubit employeeCubit;
  late Database database;
  setUpAll(() async {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory for unit testing calls for SQFlite
    databaseFactory = databaseFactoryFfi;
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    await database.execute(table);

    employeeRepo = MockChatRepository();
    employeeCubit = EmployeeCubit(employeeRepo);
  });
  tearDownAll(() {
    employeeCubit.close();
  });

  test('should be a subclass of EmployeeCubit', () {
    expect(employeeCubit, isA<EmployeeCubit>());
  });

  group("Test Employee Fetch", () {
    blocTest("Call on FetchEmployees event returns [Loading, EmployeesFetched]",
        build: () {
          when(
            () => employeeRepo.getEmployees(fakeError: false),
          ).thenAnswer(
              (_) => Future.value(StatusResponse(success: true, data: [])));
          return employeeCubit;
        },
        act: (EmployeeCubit cubit) {
          return cubit.fetchEmployees();
        },
        expect: () => [Loading(), const EmployeesFetched(employees: [])]);

    blocTest("Call on Fetch Employees event returns [Loading, Error]",
        build: () {
          when(
            () => employeeRepo.getEmployees(),
          ).thenAnswer((_) => Future.value(StatusResponse(
              success: false, errors: [const CustomError(message: "error")])));
          return employeeCubit;
        },
        act: (EmployeeCubit cubit) {
          return cubit.fetchEmployees();
        },
        expect: () => [isA<Loading>(), isA<Error>()]);
  });
}
