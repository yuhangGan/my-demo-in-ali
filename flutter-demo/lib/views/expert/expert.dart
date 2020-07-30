import 'package:doc_page/views/expert/components/card.dart';
import 'package:flutter/material.dart';
import 'components/picker.dart';

class Expert extends StatefulWidget {
  @override
  _ExpertState createState() => _ExpertState();
}

class _ExpertState extends State<Expert> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    AppBar appBar = AppBar(
      centerTitle: true,
      brightness: Brightness.light,
      title: Text(
        '小儿麻痹症',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: UnconstrainedBox(
        child: GestureDetector(
            child: Image.asset(
              'assets/images/dark-back.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        // color: Colors.yellow,
        child: Column(
          // 选择器和tip的高度总共占屏幕高度的15% 卡片列表使用滚动
          children: <Widget>[Picker(), buildTip(size), QA()],
        ),
      ),
    );
  }

  Widget buildTip(size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Color(0xFFf5f5f5),
      child: Text(
        '内容来源：夸克搜索智能聚合',
        style: TextStyle(color: Color(0xFFd4d4d4), fontSize: 16),
      ),
    );
  }
}
