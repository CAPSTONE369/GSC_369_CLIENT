import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

const List<Widget> SmallMenu = <Widget>[
  Text('All'),
  Text('COLD'),
  Text('FROZEN'),
];

class FridgeSmallDivider extends StatefulWidget {
  const FridgeSmallDivider({super.key});

  @override
  State<FridgeSmallDivider> createState() => _FridgeSmallDividerState();
}

class _FridgeSmallDividerState extends State<FridgeSmallDivider> {
  final List<bool> _selectedMenu = <bool>[true, false, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffFDFCFF),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedMenu.length; i++) {
                      _selectedMenu[i] = i == index;
                    }
                  });
                },
                borderColor: Color(0xffDCE2F9),
                selectedBorderColor: Color(0xffDCE2F9),
                selectedColor: Color(0xff151B2C),
                fillColor: Color(0xffDCE2F9),
                color: Color(0xff151B2C),
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 100.0,
                ),
                isSelected: _selectedMenu,
                children: SmallMenu,
              ),
            ],
          ),
        ));
  }
}
