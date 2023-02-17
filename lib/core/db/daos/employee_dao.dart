import 'package:mobile_assessment/core/db/app_database.dart';
import 'package:mobile_assessment/core/db/daos/base_dao.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:sqflite/sqflite.dart';

class EmployeeDao extends BaseDao<Employee> {
  var employeeTable = 'employees';

  @override
  Future deleteAll() async {
    var db = await AppDatabase.database;
    return db!.rawDelete("Delete FROM $employeeTable");
  }

  @override
  Future deleteById(int id) async {
    var db = await AppDatabase.database;
    await db!.delete(employeeTable, whereArgs: [id], where: 'id=?');
  }

  @override
  Future<Employee?> findById(id) async {
    var db = await AppDatabase.database;
    var list = await db!.query(employeeTable, whereArgs: [id], where: 'id=?');
    if (list.isNotEmpty) {
      return Employee.fromMap(list.first);
    }
    return null;
  }

  @override
  Future<List<Employee>> getAll() async {
    var db = await AppDatabase.database;
    var list = await db!.query(employeeTable);
    // log('$list');
    return list.map((e) => Employee.fromMap(e)).toList();
  }

  @override
  Future<int> insert(value) async {
    var db = await AppDatabase.database;
    return await db!.insert(employeeTable, value.toMap());
  }

  @override
  Future update(value) async {
    var db = await AppDatabase.database;
    await db!.update(employeeTable, value.toMap(),
        where: 'id=?', whereArgs: [value.id]);
  }

  @override
  Future insertAll(
    List<Employee> value,
  ) async {
    var db = await AppDatabase.database;
    var batch = db!.batch();
    for (var val in value) {
      batch.insert(employeeTable, val.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return await batch.commit(noResult: true);
    //  values.forEach((val) async{
    //   await db!.insert(tablePos, val.toMap());
    // });
  }
}
