import 'package:note_app/services/language_services.dart';
import 'locals/en_US.dart';
import 'locals/ru_RU.dart';
import 'locals/uz_uz.dart';

extension ExtString on String{
  String get tr {
    switch(LangService.language){
      case Language.en: return enUs [this] ?? this;
      case Language.ru: return ruRu [this] ?? this;
      case Language.uz: return uzUz [this] ?? this;
    }
  }

  int get toInt{
    return int.tryParse(this) ?? 0;
  }

  double get toDouble{
    return double.tryParse(this) ?? 0;
  }

  bool get toBool{
    if(this == 'true'){
      return true;
    }else{
      return false;
    }
  }
}