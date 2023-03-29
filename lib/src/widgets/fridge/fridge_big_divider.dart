import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

const List<Widget> BigMenu = <Widget>[
  Text('ALL'),
  Text('MEAT'),
  Text('VEGE'),
  Text('DAIRY'),
];

class FridgeBigDivider extends StatefulWidget {
  const FridgeBigDivider({super.key});

  @override
  State<FridgeBigDivider> createState() => _FridgeBigDividerState();
}

class _FridgeBigDividerState extends State<FridgeBigDivider> {
  final List<bool> _selectedMenu = <bool>[true, false, false, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            borderColor: Colors.transparent,
            selectedBorderColor: Colors.transparent,
            selectedColor: Color(0xff395BA9),
            fillColor: Colors.transparent,
            color: Color(0xff44464F),
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedMenu,
            children: BigMenu,
          ),
        ],
      ),
    ));
  }
}
