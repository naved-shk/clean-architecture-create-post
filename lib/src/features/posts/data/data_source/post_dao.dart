import 'package:posting_system/src/core/db/app_database.dart';
import 'package:posting_system/src/features/posts/data/models/request/post_body.dart';
import 'package:posting_system/src/features/posts/data/models/response/post_model.dart';
import 'package:sqflite/sqflite.dart';

class PostDAO {
  Future<PostModel> createPost(PostBody post) async {
    final db = await AppDatabase.instance.database;

    final id = await db.insert(tableNamePost, post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return PostModel(
        id: id,
        content: post.content,
        image: post.image,
        userId: post.userId,
        createdTime: post.createdTime);
  }

  Future<List<PostModel>> getPosts() async {
    final db = await AppDatabase.instance.database;

    final orderBy = '${PostFields.time} DESC';
    final result = await db.query(tableNamePost, orderBy: orderBy);
    return result.map((e) => PostModel.fromJson(e)).toList();
  }

  Future<PostModel> getPost(int id) async {
    final db = await AppDatabase.instance.database;
    final maps = await db.query(
      tableNamePost,
      columns: PostFields.values,
      where: '${PostFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return PostModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updatePost(PostBody post) async {
    final db = await AppDatabase.instance.database;
    return await db.update(tableNamePost, post.toJson(),
        where: '${PostFields.id} = ?', whereArgs: [post.id]);
  }

  Future<int> deletePost(int id) async {
    final db = await AppDatabase.instance.database;
    return await db
        .delete(tableNamePost, where: '${PostFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await AppDatabase.instance.database;

    db.close();
  }
}
