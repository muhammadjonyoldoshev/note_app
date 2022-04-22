class Note{
  // fields
  late String title;
  late String content;
  late String time;

  // constructor
  Note({required this.title, required this.content}){
    time = DateTime.now().toString();
  }

  // fromJson => String => object
  Note.fromJson(Map<String, dynamic> json){
    title = json['title'];
    content = json['content'];
    time = json['time'];
  }

  // toJson => object => String
  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'time': time,
  };

  @override
  String toString() {
    // TODO: implement toString
    return 'Title: $title\nContent: $content';
  }
}