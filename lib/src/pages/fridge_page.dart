import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../widgets/fridge/fridge_appbar.dart';
import '../widgets/fridge/fridge_big_divider.dart';
import '../widgets/fridge/fridge_food_card.dart';
import '../widgets/fridge/fridge_small_divider.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FridgeAppBar(),
            const FridgeBigDivider(),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.black26,
              height: 2,
            ),
            const SizedBox(
              height: 12,
            ),
            const FridgeSmallDivider(),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: 12,
              itemBuilder: (BuildContext context, int idx) {
                return Column(children: <Widget>[
                  FridgeFoodCard(),
                ]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const ColoredBox(
                      color: Color(0xffFDFCFF), child: SizedBox(height: 5)),
            )),
          ],
        ),
      ),
    );
  }
}
