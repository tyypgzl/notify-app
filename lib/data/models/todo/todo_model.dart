import 'package:equatable/equatable.dart';
import 'package:notify/data/models/todo/todo.dart';

final class TodoModel with EquatableMixin {
  const TodoModel({
    this.id,
    this.title,
    this.description,
    this.colorNumber,
    this.activity,
    this.createdTime,
  });
  final String? id;
  final String? title;
  final String? description;
  final int? colorNumber;
  final TodoActivity? activity;
  final DateTime? createdTime;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        colorNumber,
        activity,
        createdTime,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'colorNumber': colorNumber,
      'activity': activity?.index,
      'createdTime': createdTime?.toIso8601String(),
    };
  }

  TodoModel fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      colorNumber: json['colorNumber'] as int?,
      activity: TodoActivity.values.elementAt(json['activity'] as int? ?? 0),
      createdTime: DateTime.tryParse(json['createdTime'] as String? ?? ''),
    );
  }
}
