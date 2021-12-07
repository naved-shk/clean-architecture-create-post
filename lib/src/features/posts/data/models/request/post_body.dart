import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:posting_system/src/features/posts/data/models/response/post_model.dart';

class PostBody extends Equatable {
  final String? id;
  final String content;
  final Uint8List? image;
  final String userId;
  final DateTime createdTime;

  const PostBody(
      {this.id,
      required this.content,
      this.image,
      required this.userId,
      required this.createdTime});

  @override
  List<Object?> get props => [id, content, image, userId, createdTime];

  Map<String, Object?> toJson() => {
        PostFields.id: id,
        PostFields.content: content,
        PostFields.image: image,
        PostFields.userId: userId,
        PostFields.time: createdTime.toIso8601String()
      };
}
