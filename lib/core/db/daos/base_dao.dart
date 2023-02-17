abstract class BaseDao<T> {
  Future<int> insert(T value);

  Future<dynamic> insertAll(List<T> value);

  Future update(T value);

  Future deleteById(int id);

  Future deleteAll();

  Future<List<T>> getAll();

  Future<T?> findById(dynamic id);
}
