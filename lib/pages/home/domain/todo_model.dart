import 'dart:convert';

class TodoModel {
  TodoModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  factory TodoModel.fromRawJson(String str) =>
      TodoModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"] as int,
        id: json["id"] as int,
        title: json["title"] as String,
        completed: json["completed"] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
