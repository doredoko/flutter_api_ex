import 'dart:ffi';

class Tasks {
  // コンストラクタ
   Tasks({
    required this.id,
    required this.title,
    required this.done,
  });

  // プロパティ
  final Int id;
  final String title;
  final Int done;

// JSONからUserを生成するファクトリコンストラクタ
  factory Tasks.fromJson(dynamic json) {
    return Tasks(
      id: json['id'] as Int,
      title: json['ptitle'] as String,
      done: json['done'] as Int,
    );
  }
}

