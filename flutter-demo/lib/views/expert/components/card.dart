import 'package:flutter/material.dart';

List allCardsList = [
  {
    'title': ['小儿麻痹症', '是怎么引起的'],
    'content': '我朋友的孩子最近无法正常行走，医院检查发现患有我朋友的孩子最近无法正常行走，医院检查发现患有',
    'doctorAvatar': 'assets/images/doctor.png',
    'doctorName': '张正华',
    'position': '主治医师',
    'hospital': '北京协和医院',
    'answer':
        '脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽'
  },
  {
    'title': ['小儿麻痹症', '是怎么引起的'],
    'content': '我朋友的孩子最近无法正常行走，医院检查发现患有我朋友的孩子最近无法正常行走，医院检查发现患有',
    'doctorAvatar': 'assets/images/doctor.png',
    'doctorName': '张正华',
    'position': '主治医师',
    'hospital': '北京协和医院',
    'answer':
        '脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽'
  },
  {
    'title': ['小儿麻痹症', '是怎么引起的'],
    'content': '我朋友的孩子最近无法正常行走，医院检查发现患有我朋友的孩子最近无法正常行走，医院检查发现患有',
    'doctorAvatar': 'assets/images/doctor.png',
    'doctorName': '张正华',
    'position': '主治医师',
    'hospital': '北京协和医院',
    'answer':
        '脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽'
  },
  {
    'title': ['小儿麻痹症', '是怎么引起的'],
    'content': '我朋友的孩子最近无法正常行走，医院检查发现患有我朋友的孩子最近无法正常行走，医院检查发现患有',
    'doctorAvatar': 'assets/images/doctor.png',
    'doctorName': '张正华',
    'position': '主治医师',
    'hospital': '北京协和医院',
    'answer':
        '脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽脊髓灰质炎又名小儿麻痹症，是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要有发热、咽'
  }
];

class QA extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<QA> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        width: width,
        // height: height * 0.78 - 24,
        padding: EdgeInsets.only(
            top: 15, bottom: 0, right: width * 0.05, left: width * 0.05),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: buildCardList(width),
          ),
        ),
      ),
    );
  }

  // 生成外层卡片列表
  List<Widget> buildCardList(double width) {
    List<Widget> cards = [];
    allCardsList.forEach((e) {
      cards.add(buildOuterCard(width, e));
    });
    return cards;
  }

  // 生成外层卡片
  Widget buildOuterCard(double width, Map msg) {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(msg),
          buildContent(msg),
          buildInnerCard(width, msg)
        ],
      ),
    );
  }

  // 生成裁剪型内容
  Widget buildContent(Map msg) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        msg['content'],
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(color: Color(0xFF686868)),
      ),
    );
  }

  // 生成外层卡片标题
  Widget buildTitle(Map msg) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: msg['title'][0],
          style: TextStyle(
              color: Color(0xFF00b395),
              fontWeight: FontWeight.bold,
              fontSize: 18)),
      TextSpan(
          text: msg['title'][1],
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
              fontSize: 18))
    ]));
  }

  // 生成内层卡片
  Widget buildInnerCard(double width, Map msg) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFf5f5f5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildDoc(msg),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: width * 0.90 - 20,
                child: Text(
                  msg['answer'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xFF707070)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // 生成内层卡片医生信息
  Widget buildDoc(Map msg) {
    return Row(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(
              msg['doctorAvatar'],
              height: 35,
              width: 35,
            )),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: msg['doctorName'],
              style: TextStyle(
                  color: Color(0xFF515151), fontWeight: FontWeight.bold)),
          TextSpan(
              text: '${msg['position']} | ${msg['hospital']}',
              style: TextStyle(color: Color(0xFFb0b0b0))),
        ])),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 179, 149, 0.03),
              borderRadius: BorderRadius.circular(3),
              border: Border.all(width: 0.7, color: Color(0xFF00BF9F))),
          child: Text('三甲',
              style: TextStyle(
                  color: Color(0xFF19ba9f), fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
