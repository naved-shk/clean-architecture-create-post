import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? id;
  final String content;
  final Uint8List? image;
  final String userId;
  final DateTime createdTime;
  final bool isDeleting;

  const PostEntity({
    required this.id,
    required this.content,
    required this.image,
    required this.userId,
    required this.createdTime,
    required this.isDeleting,
  });

  PostEntity copyWith(
      {int? id,
      String? content,
      Uint8List? image,
      String? userId,
      DateTime? createdTime,
      bool? isDeleting}) {
    return PostEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      image: image ?? this.image,
      userId: userId ?? this.userId,
      createdTime: createdTime ?? this.createdTime,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object?> get props =>
      [id, content, image, userId, isDeleting, createdTime];
}
