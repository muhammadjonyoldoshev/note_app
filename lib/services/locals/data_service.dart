import 'dart:convert';
import 'dart:io';

class DataService {
  Directory directory = Directory(Directory.current.path + "\\assets\\files");
  late File file;
/// Initialization of the file json
  Future<void> init() async {
    bool isDirectoryCreated = await directory.exists();
    if (!isDirectoryCreated) {
      directory.create();
    }
    file = File(directory.path + "\\data.json");
    bool isFileCreated = await file.exists();
    if (!isFileCreated) {
      await file.create();
    }
  }

  ///This method to use for store String
  Future<bool> storeString({required String key, required String value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source).whenComplete((){
      result = true;
    });
    return result;
  }

  ///This method to use for store int
  Future<bool> storeInt({required String key, required int value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source)
        .whenComplete(() => result = true)
        .catchError((_) {
      result = false;
    });
    return result;
  }

  ///This method to use for store bool
  Future? storeBool({required String key, required bool value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }

    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source)
        .whenComplete(() => print("succes"))
        .catchError((_) {
        });
  }

  ///This method to use for store double
  Future<bool> storeDouble({required String key, required double value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source)
        .whenComplete(() => result = true)
        .catchError((_) {
      result = false;
    });
    return result;
  }

  ///This method to use for store List
  Future<bool> storeList({required String key, required List<String> value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source)
        .whenComplete(() => result = true)
        .catchError((_) {
      result = false;
    });
    return result;
  }

  ///This method to use for read data
  Future? readData(String key) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }

    return database[key];
  }

  ///This method to use for delete data
  Future<bool> deleteData({required String key}) async {
    String source = await file.readAsString();
    if (source.isEmpty) {
      return false;
    }

    Map<String, dynamic> database;
    database = jsonDecode(source);
    database.remove(key);
    source = jsonEncode(database);
    await file.writeAsString(source).catchError((_) {
      /* error msg*/
    });
    return true;
  }

  ///This method to use for clear data
  Future<bool> clearData() async{
    await file.writeAsString('{}').catchError((_) {
      /* error msg*/
    });
    return true;
  }
}











