import 'dart:ffi';

class Dones {
  // コンストラクタ
  Dones({
    required this.id,
    required this.tasks_id,
  });

  // プロパティ
  final int id;
  final Int tasks_id;

// JSONからUserを生成するファクトリコンストラクタ
  factory Dones.fromJson(dynamic json) {
    return Dones(
      id: json['id'] as Int,
      tasks_id: json['tasks_id'] as Int,
    );
  }
}

