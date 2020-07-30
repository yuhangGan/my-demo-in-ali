import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey tKey = GlobalKey();
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.936,
      padding: EdgeInsets.only(bottom: 30),
      margin: EdgeInsets.only(
          left: width * 0.0332, right: width * 0.0332, top: 110),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        key: tKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildAvatar(tKey), // 头像和关注按钮
          buildDocMsg(), // 医生基本信息：基本信息 + 专业擅长 + 评价
        ],
      ),
    );
  }
}

// 医生信息
Widget buildDocMsg() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(TextSpan(children: [
          TextSpan(
            text: '张昊然',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(text: '  '),
          TextSpan(
              text: '主任医师 皮肤科', style: TextStyle(fontWeight: FontWeight.bold))
        ])),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              decoration: BoxDecoration(
                  color: Color(0xFF00c19d),
                  borderRadius: BorderRadius.circular(3)),
              child: Text('三甲',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
            ),
            Text('浙江省第一人民医院', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '毕业于上海医科大学医学系，毕业于上海医科大学医学系',
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(color: Colors.grey),
              ),
            )),
            Text(
              '简介 >',
              style: TextStyle(color: Color(0xFF00B395)),
            )
          ],
        ),
        buildGoodAt(), // 专业擅长
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buildEvaluate(),
        )
      ],
    ),
  );
}

// 医生评价
List<Widget> buildEvaluate() {
  List evaluate = [
    ['4.9', '综合评价'],
    ['7812', '服务患者数'],
    ['80%', '好评率']
  ];
  List<Widget> eva = [];
  evaluate.forEach((e) {
    var node = Column(
      children: <Widget>[
        Text(
          e[0],
          style: TextStyle(
              color: Color(0xFF00B395),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Text(
          e[1],
          style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 18),
        )
      ],
    );
    eva.add(node);
  });
  return eva;
}

// 专业擅长
Widget buildGoodAt() {
  return Row(
    children: <Widget>[
      Image.asset(
        'assets/images/goodat.png',
        height: 15,
      ),
      Expanded(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 0, top: 20, bottom: 20),
          child: Row(
            children: buildGoodAtTags(),
          ),
        ),
      ))
    ],
  );
}

// 生成专业擅长的标签
List<Widget> buildGoodAtTags({List<String> nonDocTags, BoxDecoration dec}) {
  List<Widget> tags = [];
  List<String> tagsText = nonDocTags ?? ['银屑病', '湿疹', '皮肤病', '过敏性皮炎', '银屑病'];
  tagsText.forEach((text) {
    var tag = new Container(
        child: Text(
          text,
          style: TextStyle(color: Color(0xFF666666)),
        ),
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: dec ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Color(0xFFE6E6E6),
                    width: 1,
                    style: BorderStyle.solid)));
    tags.add(tag);
  });
  return tags;
}

// 头像以及关注
Widget buildAvatar(GlobalKey tKey) {
  return SizedBox(
    height: 70,
    child: Stack(
      // key: tKey,
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
            top: -20,
            left: 5,
            right: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Colors.white,
                                width: 3,
                                style: BorderStyle.solid)),
                        child: Image.asset(
                          'assets/images/doctor.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      buildTags(-10, 0, null, '⭐金牌医生'),
                      buildTags(-10, null, -110, '复旦排行榜TOP1'),
                    ],
                  ),
                  buildSubBtn(),
                ],
              ),
            ))
      ],
    ),
  );
}

// 关注按钮
Widget buildSubBtn() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(
        color: Color(0xFFe5f8f5), borderRadius: BorderRadius.circular(15)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 5),
          child: Image.asset(
            'assets/images/subscrition.png',
            width: 22,
            height: 18,
          ),
        ),
        Text(
          '关注',
          style:
              TextStyle(color: Color(0xFF00B395), fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

// 生成医生头像底部标签
Widget buildTags(double bot, double l, double r, String text) {
  return Positioned(
      bottom: bot,
      left: l,
      right: r,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            gradient: LinearGradient(
                stops: [0.1, 0.4],
                colors: [Color(0xFFB3896B), Color(0xFF80624D)])),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, letterSpacing: 1, fontSize: 11),
        ),
      ));
}
