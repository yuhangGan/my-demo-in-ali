import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/comment.dart';
import 'package:date_format/date_format.dart';

class CommentNotifier with ChangeNotifier {
  List<Comment> _commentList = [];

  get commentList => _commentList;

  setCommentList(List<Map> data) {
    data.forEach((element) {
      _commentList.add(Comment.fromMap(element));
    });
  }

  addComment(Comment comment) {
    comment.tags = ['标签', '标签', '标签'];
    comment.date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
    comment.stars = 4;
    _commentList.add(comment);
    notifyListeners();
  }

  modifyComment(String user) {
    _commentList[0].user = user;
  }

  deleteComment(Comment comment) {
    _commentList.remove(comment);
    print(_commentList);
  }
}
