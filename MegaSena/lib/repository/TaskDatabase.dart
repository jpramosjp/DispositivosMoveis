import '../components/Task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskDataBase {
  static final TaskDataBase _singleton = new TaskDataBase();

  factory TaskDataBase() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "todo.db");
    var bd = await openDatabase(localDatabase, version: versiondb,
        onCreate: (db, versiondb) {
      String sql =
          "create table task(id integer primary key, descricao varchar)";
      db.execute(sql);
    });
    return bd;
  }

  static salvar(Task task) async {
    Database bd = await _dataBaseManager();
    Map<String, dynamic> dadosTask = {"descricao": task.descricao};
    int id = await bd.insert("task", dadosTask);
    print("Salvo:  $id");
  }

  static Future listTask() async {
    Database bd = await _dataBaseManager();
    List listaTasks = await bd.rawQuery("select * from task");
    var _tasks = new List();
    for (var item in listaTasks) {
      var task = new Task(item['descricao'], true);
      task.id = item['id'];
    }
    return _tasks;
  }
}
