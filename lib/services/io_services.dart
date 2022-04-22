import 'dart:io';

void write<T>(T object){
  stdout.write(object);
}

void writeln<T>(T object){
  stdout.write(object);
}

String read(){
  String result = stdin.readLineSync() ?? '';
  return result;
}

String clear(){
  String res = stdin.readLineSync() ?? '';
  return res;
}