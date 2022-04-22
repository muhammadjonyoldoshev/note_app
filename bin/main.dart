import 'package:note_app/model/not_model.dart';
import 'package:note_app/services/file_services.dart';
import 'package:note_app/services/io_services.dart';

void main() async {
  FileService fileService = FileService();
  await fileService.init();

  String title = "";
  String content = "";
  String exit = "";

  writeln("Iltimos Noteni nomini kiriting");
  title = read();

 // await fileService.updateFile(title);

 // await fileService.deleteFile(title);


  // Note note = await fileService.readFile(title);
  // print(note);

  // String path = await fileService.creatFile(title);
  // writeln("Noteni yozishingiz mumkin(Noteni tugatgach save so'zini kiritsangiz note saqlab qo'yiladi)");
  // while(exit != 'save'){
  //   exit = read();
  //   if(exit == 'save'){
  //     break;
  //   }
  //   content += (exit + '\n');
  // }
  // Note note =Note(title: title, content: content);
  // await fileService.writeFile(note, path).then((value) => print("Note muvaffaqiyatli saqlandi"));
}








