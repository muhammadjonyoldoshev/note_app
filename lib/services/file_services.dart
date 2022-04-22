import 'dart:convert';
import 'dart:io';
import 'package:note_app/model/not_model.dart';
import 'package:note_app/services/io_services.dart';

class FileService {
  Directory directory = Directory(Directory.current.path + "\\assets\\files");

  /// Initialization of the file json
  Future<void> init() async {
    bool isDirectoryCreated = await directory.exists();
    if (!isDirectoryCreated) {
      await directory.create();
    }
  }

  ///This method to use for creat file
  Future<String> creatFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if (isFileCreated) {
      /// this below code will be edited when i set language service
      throw Exception("This file already created please try create new file");
    }
    await file.create();
    return file.path;
  }

  ///This method to use for write file
  Future<String> writeFile(Note note, String path) async {
    File file = File(path);
    /// KRIPTOGRAFIK CODE => ENICODE
    await file.create();
    await file.writeAsString(jsonEncode(note.toJson()));
    await file.setLastModified(DateTime.parse(note.time));
    return file.path;
  }

  ///This method to use for read file
  Future<Note> readFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if (!isFileCreated) {
      /// this below code will be edited when i set language service
      throw Exception("File not found");
    }

    String result = await file.readAsString();
    Note note = Note.fromJson(jsonDecode(result));
    return note;
  }

  ///This method to use for update file
  Future<String> updateFile(String title) async {
    String path = directory.path + "\\$title.note";
    Note note = await readFile(title);
    
    writeln("O'zgartirmoqchi bo'lingan note:");
    write(note);
    writeln("Yangilanishni kiriting");
    String content = "";
    String exit = "";
    while(exit != 'save'){
        exit = read();
        if(exit == 'save'){
          break;
        }
        content += (exit + '\n');
      }
      note.content = content;
    note.time = DateTime.now().toString();
    return await writeFile(note, path);
  }

  ///This method to use for delete file
  Future<String> deleteFile(String title) async{
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if(isFileCreated){
      await file.delete();
    }else{
      return 'Bunday note mavjud emas';
    }
    return 'Deleted';
  }
}