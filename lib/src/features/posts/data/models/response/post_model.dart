import 'dart:typed_data';

import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';

const String tableNamePost = 'posts';

class PostFields {
  static const List<String> values = [id, content, image, userId, time];

  static const String id = '_id';
  static const String content = 'content';
  static const String image = 'image';
  static const String userId = 'user_id';
  static const String time = 'time';

  static String create() {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const imageType = 'BLOB';
    return '''CREATE TABLE $tableNamePost(
      $id $idType ,
      $content $textType,
      $image $imageType,
      $userId $textType,
      $time $textType
      )''';
  }
}

class PostModel extends PostEntity {
  const PostModel(
      {int? id,
      required content,
      Uint8List? image,
      required userId,
      isDeleting = false,
      required DateTime createdTime})
      : super(
            id: id,
            content: content,
            image: image,
            userId: userId,
            isDeleting: isDeleting,
            createdTime: createdTime);

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json[PostFields.id] as int?,
        content: json[PostFields.content] as String,
        image: json[PostFields.image] as Uint8List?,
        userId: json[PostFields.userId] as String,
        createdTime: DateTime.parse(json[PostFields.time] as String),
      );
}
