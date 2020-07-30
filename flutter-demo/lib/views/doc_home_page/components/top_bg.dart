import 'package:flutter/material.dart';
import './doctor.dart';
import 'dart:async';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Container(
            width: width,
            height: 150,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/bg.jpg',
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                buildGradient(width),
                buildBroadcast(width)
              ],
            )),
        Doctor(),
      ],
    );
  }

  // 生成顶部图的渐变遮罩层
  Widget buildGradient(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(0, 0, 0, .4),
            Color.fromRGBO(0, 0, 0, 0.4),
            Colors.white
          ],
              stops: [
            0.1,
            0.5,
            1
          ])),
    );
  }

  Widget buildSlider(double width) {
    ScrollController _controller = new ScrollController();
    int _page = 1;
    int _count = 0;

    // 计时器: 1秒后启动
    Timer timer = new Timer(Duration(seconds: 1), () {
      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: Duration(seconds: 3), curve: Curves.linear);
    });

    _controller.addListener(() {
      if (_controller.offset == _controller.position.maxScrollExtent) {
        _controller.jumpTo(0);
        _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(seconds: 3), curve: Curves.linear);
      }
    });

    var broadcast = new SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Text('医生说：每周三至周五上午8点可在线接诊', style: TextStyle(color: Colors.white)),
          Text('    '),
          Container(
            width: width * 0.64,
            child: Text(
              '医生说：每周三至周五上午8点可在线接诊',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          )
        ],
      ),
    );

    return broadcast;
  }

  // 生成公告栏
  Widget buildBroadcast(double width) {
    return Positioned(
        top: 70,
        height: 30,
        right: width * 0.04,
        child: Container(
            width: width * 0.7,
            padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: width * 0.03),
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: buildSlider(width)));
  }
}
