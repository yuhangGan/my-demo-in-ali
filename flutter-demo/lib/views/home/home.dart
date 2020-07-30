import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            buildBtn('go doc page', context, '/doc_home_page',
                arguments: {'id': '111'}),
            buildBtn('go expert page', context, '/expert'),
            buildBtn('go new comment page', context, '/new_comment')
          ],
        ),
      ),
    );
  }

  // 生成路由按钮
  Widget buildBtn(String text, BuildContext context, String route,
      {Map arguments}) {
    return RaisedButton(
        child: Text(text),
        onPressed: () {
          Navigator.pushNamed(context, route);
        });
  }
}
