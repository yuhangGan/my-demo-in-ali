import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTitle(), // 生成顶部栏
        buildConsulting() // 生成咨询部份
      ],
    );
  }

  // 生成咨询部分
  Widget buildConsulting() {
    return Column(children: buildConsultingItems());
  }

  // 生成咨询途径列表
  List<Widget> buildConsultingItems() {
    List<Widget> cos = [];
    List texts = [
      {
        'icon': 'assets/images/picture.png',
        'path': '图文咨询',
        'price': '￥50/次',
        'discount': '券后￥30',
        'description': '48小时内图文多次沟通'
      },
      {
        'icon': 'assets/images/phone.png',
        'path': '电话咨询',
        'price': '￥100/10分钟',
        'discount': '券后￥80',
        'description': '无话费，直接沟通更清楚'
      },
      {
        'icon': 'assets/images/recheck.png',
        'path': '复诊开方',
        'price': '￥100/次',
        'discount': '',
        'description': '这里是复诊开方简介'
      }
    ];
    texts.forEach((e) {
      var node = buildSingleConsulting(e);
      cos.add(node);
    });
    return cos;
  }

  // 生成单条咨询途径
  Widget buildSingleConsulting(Map e) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            e['icon'],
            width: 40,
            height: 40,
          ),
          buildConsultingText(e), // 生成咨询方法以及描述
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xFF00CC99), Color(0xFF00BF9F)])),
            child: Text(
              '去咨询 >',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  // 生成咨询方法以及描述
  Widget buildConsultingText(Map e) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: e['path'],
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: e['price'],
                      style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
                ])),
                SizedBox(
                  child: e['discount'] == ''
                      ? null
                      : Container(
                          margin: EdgeInsets.only(left: 5),
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color(0xFFFF5500),
                                  style: BorderStyle.solid)),
                          child: Text(e['discount'],
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFFF5500),
                              )),
                        ),
                )
              ],
            ),
          ),
          Text(e['description'],
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFAAAAAA),
              ))
        ],
      ),
    ));
  }

  // 生成顶部栏部分
  Widget buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '在线服务',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '2张',
              style: TextStyle(color: Color(0xFFFF5500), fontSize: 16)),
          TextSpan(
              text: '优惠券可以领>',
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
              ))
        ]))
      ],
    );
  }
}
