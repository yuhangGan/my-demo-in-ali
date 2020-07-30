import 'package:flutter/material.dart';

import '../../../notifier/comment_notifier.dart';
import 'package:provider/provider.dart';
import '../../../models/comment.dart';

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommentNotifier commentNotifier =
        Provider.of<CommentNotifier>(context, listen: false);
    Comment _comment = new Comment();
    TextEditingController con = TextEditingController();

    // 修改评论
    void deleteComment(Comment comment) {
      commentNotifier.deleteComment(comment);
    }

    return Expanded(
        child: Consumer<CommentNotifier>(builder: (context, provider, child) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: provider.commentList.length,
          itemBuilder: (context, index) {
            return Selector<CommentNotifier, Comment>(
              selector: (_, provider) => provider.commentList[index],
              builder: (context, value, child) {
                return Dismissible(
                    key: Key(UniqueKey().toString()),
                    onDismissed: (dir) {
                      deleteComment(value);
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                      padding: EdgeInsets.only(right: 50),
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child:
                          Text('delete', style: TextStyle(color: Colors.white)),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFDDDDDD),
                                  style: BorderStyle.solid,
                                  width: 1))),
                      child: ListTile(
                        title: Text(value.user),
                        subtitle: Text(value.content),
                      ),
                    ));
              },
            );
          });
    }));
  }
}
