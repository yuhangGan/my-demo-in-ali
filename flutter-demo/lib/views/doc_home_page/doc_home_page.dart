import 'package:flutter/material.dart';

import 'components/top_bg.dart';
import 'components/comments.dart';
import 'components/services.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  GlobalKey testKey = GlobalKey();

  ScrollController _controller = new ScrollController();
  bool showTopBar = true;

  @override
  void initState() {
    super.initState();

    // 往下滚动时隐藏返回和分享按钮
    // _controller.addListener(() {
    //   if (showTopBar && _controller.offset >= 10) {
    //     print('a');
    //     setState(() {
    //       showTopBar = false;
    //     });
    //   } else if (!showTopBar && _controller.offset < 10) {
    //     setState(() {
    //       showTopBar = true;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // Map parms = ModalRoute.of(context).settings.arguments;
    // print(parms['id']);
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: testKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: <Widget>[
          buildMainStructure(width),
          buildTBBar(),
        ],
      ),
    );
  }

  // 生成页面主要结构
  Widget buildMainStructure(double width) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: <Widget>[
          Container(
            // 顶部背景图 + 医生信息
            margin: EdgeInsets.only(bottom: 15),
            child: Background(),
          ),
          Container(
            // 在线服务
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            width: width * 0.936,
            child: Services(),
          ),
          Container(
            // 评论列表
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            width: width * 0.936,
            child: Comments(),
          )
        ],
      ),
    );
  }

  // 生成固定顶部栏
  Widget buildTBBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: showTopBar
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    child: Image.asset(
                      'assets/images/back.png',
                      height: 20,
                      width: 20,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                Image.asset(
                  'assets/images/share.png',
                  height: 20,
                  width: 20,
                )
              ],
            )
          : null,
    );
  }
}
