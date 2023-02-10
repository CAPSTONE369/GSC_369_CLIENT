import 'package:flutter/material.dart';

class FridgeAppBar extends StatefulWidget {
  FridgeAppBar();

  @override
  _FridgeAppBarState createState() => _FridgeAppBarState();
}

class _FridgeAppBarState extends State<FridgeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              Text('My Fridge',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
