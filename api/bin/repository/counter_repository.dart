import 'package:hive/hive.dart';

class CountRepository {
  late Box db;

  CountRepository._privateConstructor() {
    db = Hive.box('db');
  }

  void setCount(int count) => db.put('count', count);

  int getCount() => db.get('count') ?? 0;

  static final CountRepository instance = CountRepository._privateConstructor();
}
