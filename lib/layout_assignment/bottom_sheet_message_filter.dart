import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/xprint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: MyPage()),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyPageBottomSheet();
  }
}

class SwitchModal {
  final String title;
  final ValueChanged<bool>? onChanged;

  SwitchModal({required this.title, required this.onChanged});
}

class MyPageBottomSheet extends StatefulWidget {
  const MyPageBottomSheet({super.key});

  @override
  State<MyPageBottomSheet> createState() => _MyPageBottomSheetState();
}

class _MyPageBottomSheetState extends State<MyPageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _displayBottomSheet(context);
        },
        child: const Text('Show Message Filter'),
      ),
    );
  }
}

class CustomSwitchGroup extends StatelessWidget {
  const CustomSwitchGroup({super.key, this.header, required this.switchList});

  final String? header;
  final List<SwitchModal> switchList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (header != null)
          Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                header!,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(18, 18, 18, 0.48)),
              )),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: switchList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Divider(),
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return CustomSwitch(
                title: switchList[index].title,
                onChange: switchList[index].onChanged,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final String title;
  final ValueChanged<bool>? onChange;

  const CustomSwitch({super.key, required this.title, required this.onChange});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  var _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Transform.scale(
              scale: 0.9,
              child: CupertinoSwitch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                    widget.onChange?.call(_switchValue);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _displayBottomSheet(BuildContext context) async {
  List<SwitchModal> switchList1 = [
    SwitchModal(
        title: '显示全部消息',
        onChanged: (val) {
          xPrint(val);
        }),
    SwitchModal(
        title: 'test',
        onChanged: (val) {
          xPrint(val);
        }),
  ];
  List<SwitchModal> switchList2 = [
    SwitchModal(
        title: '中奖公告',
        onChanged: (val) {
          xPrint(val);
        }),
    SwitchModal(
        title: '投注公告',
        onChanged: (val) {
          xPrint(val);
        }),
  ];
  List<SwitchModal> switchList3 = [
    SwitchModal(
        title: '开奖结果',
        onChanged: (val) {
          xPrint(val);
        }),
    SwitchModal(
        title: '聊天信息',
        onChanged: (val) {
          xPrint(val);
        }),
  ];

  var commonTextStyle =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 17);
  return showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    builder: (context) => SizedBox(
      height: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "取消",
                    style: commonTextStyle,
                  )),
              Text(
                "消息过滤",
                style: commonTextStyle,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "完成",
                    style: commonTextStyle,
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    CustomSwitchGroup(
                      switchList: switchList1,
                    ),
                    CustomSwitchGroup(
                      header: '公告信息',
                      switchList: switchList2,
                    ),
                    CustomSwitchGroup(
                      header: '系统信息',
                      switchList: switchList3,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  ).then((value) {
    xPrint('Test123');
  });
}
