import 'package:flutter/material.dart';
import './doctor.dart';
import 'package:provider/provider.dart';
import '../../../notifier/comment_notifier.dart';
import 'package:date_format/date_format.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CommentNotifier commentNotifier =
        Provider.of<CommentNotifier>(context, listen: false);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '医生评价',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              '全部评论 >',
              style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
            )
          ],
        ),
        buildCommentItems(commentNotifier),
      ],
    );
  }
}

// 生成五星评分
Widget buildStars(int star) {
  return Expanded(
      child: Padding(
    padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.star, size: 15, color: star >= 1 ? Color(0xFF00CC99) : null),
        Icon(Icons.star, size: 15, color: star >= 2 ? Color(0xFF00CC99) : null),
        Icon(Icons.star, size: 15, color: star >= 3 ? Color(0xFF00CC99) : null),
        Icon(Icons.star, size: 15, color: star >= 4 ? Color(0xFF00CC99) : null),
        Icon(Icons.star, size: 15, color: star >= 5 ? Color(0xFF00CC99) : null)
      ],
    ),
  ));
}

// 生成单条评论
Widget buildComment(Map comment) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              comment['user'],
              style: TextStyle(color: Color(0xFF666666)),
            ),
            buildStars(comment['stars']),
            Text(dateCount(comment['date']))
          ],
        ),
        Row(
          children: buildGoodAtTags(
              nonDocTags: comment['tags'],
              dec: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            comment['content'],
            style: TextStyle(color: Color(0xFF444444), fontSize: 16),
          ),
        )
      ],
    ),
  );
}

// 生成评论列表
Widget buildCommentItems(CommentNotifier commentProvider) {
  List<Widget> comments = [];
  commentProvider.commentList.forEach((ele) {
    comments.add(buildComment(ele.toMap()));
  });
  return Consumer<CommentNotifier>(
    builder: (context, provider, child) {
      return Column(children: comments);
    },
  );
}

// 日期计算
String dateCount(String oldDate) {
  int thatMonth = int.parse(oldDate.split('-')[1]);
  int thatDay = int.parse(oldDate.split('-')[2]);
  int thisMonth = int.parse(formatDate(DateTime.now(), [mm]));
  int today = int.parse(formatDate(DateTime.now(), [dd]));

  int dDif = (thisMonth - thatMonth) * 30 - thatDay + today;
  String date;
  if (dDif == 0)
    date = '今天';
  else if (dDif <= 30)
    date = '${dDif}天前';
  else
    date = '${dDif / 30}月前';
  return date;
}
