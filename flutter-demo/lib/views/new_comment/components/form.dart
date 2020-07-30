import 'package:flutter/material.dart';

import '../../../models/comment.dart';
import '../../../notifier/comment_notifier.dart';
import 'package:provider/provider.dart';

class CommentForm extends StatefulWidget {
  @override
  _CommentFormState createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  final _formKey = GlobalKey<FormState>();
  bool isAutovalidate = false;

  @override
  Widget build(BuildContext context) {
    CommentNotifier commentNotifier =
        Provider.of<CommentNotifier>(context, listen: false);
    Comment _comment;

    // 添加评论
    void addComment() {
      commentNotifier.addComment(_comment);
    }

    // 修改评论
    void modifyComment(String user) {
      commentNotifier.modifyComment(user);
    }

    // 提交评论
    void submit() {
      _comment = new Comment();
      FormState state = _formKey.currentState;
      if (state.validate()) {
        state.save();
        addComment();
        state.reset();
        FocusScope.of(context).unfocus();
        isAutovalidate = false;
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('comment has been added')));
      } else {
        isAutovalidate = true;
      }
    }

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            buildTextField(Icon(Icons.person), 'type your username', 'username',
                (String value) {
              _comment.user = value;
            }),
            buildTextField(
                Icon(Icons.comment), 'write down your comment', 'comment',
                (String value) {
              _comment.content = value;
            }),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                color: Color(0xFF0080FF),
                child: Text(
                  'post your comment',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: submit)
          ],
        ));
  }

  Widget buildTextField(Icon icon, String ht, String lt, Function fn) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
          autovalidate: isAutovalidate,
          decoration:
              InputDecoration(prefixIcon: icon, hintText: ht, labelText: lt),
          validator: (val) {
            if (val.isEmpty) {
              return 'input value must not be empty';
            }
            return null;
          },
          onSaved: fn),
    );
  }
}
