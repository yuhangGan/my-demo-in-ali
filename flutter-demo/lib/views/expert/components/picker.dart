import 'package:flutter/material.dart';

const allMenu = {
  'people': ['人群1', '人群2'],
  'symptom': ['症状1', '症状2', '症状3'],
  'disease': ['疾病1', '疾病2', '疾病3']
};

const meunBtnText = {'people': '人群', 'symptom': '其他症状', 'disease': '已患疾病'};

class Picker extends StatefulWidget {
  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  Map curVal = {'people': null, 'symptom': null, 'disease': null};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildDropDown('people'),
          Text(
            '|',
            style: TextStyle(color: Color(0xFFEEEEEE)),
          ),
          buildDropDown('symptom'),
          Text(
            '|',
            style: TextStyle(color: Color(0xFFEEEEEE)),
          ),
          buildDropDown('disease')
        ],
      ),
    );
  }

  // 生成下拉菜单按钮
  Widget buildDropDown(String type) {
    return DropdownButton(
        items: buildMenu(type),
        hint: Text(
          curVal[type] != null
              ? allMenu[type][curVal[type]]
              : meunBtnText[type],
          style: TextStyle(color: Colors.black),
        ),
        underline: Container(
          height: 0,
        ),
        onChanged: (selectedVal) {
          setState(() {
            curVal[type] = int.parse(selectedVal);
          });
        });
  }

  // 生成菜单
  List<DropdownMenuItem<String>> buildMenu(String type) {
    List<DropdownMenuItem<String>> menu = [];
    List types = allMenu[type];
    for (int i = 0; i < types.length; i++) {
      menu.add(DropdownMenuItem(
        child: Text(
          types[i],
          style: TextStyle(color: curVal[type] == i ? Colors.red : Colors.grey),
        ),
        value: i.toString(),
      ));
    }
    return menu;
  }
}
