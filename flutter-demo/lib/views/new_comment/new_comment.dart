import 'package:flutter/material.dart';
import './components/form.dart';
import './components/list.dart';

class NewComment extends StatefulWidget {
  @override
  _NewCommentState createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('new comment'),
      ),
      body: Column(
        children: <Widget>[CommentForm(), CommentList()],
      ),
    );
  }
}
