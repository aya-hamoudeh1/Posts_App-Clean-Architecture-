import 'package:posts_app/features/post/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "body": body};
  }
}
