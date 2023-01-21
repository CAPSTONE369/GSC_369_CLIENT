import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FridgeBigDivider extends StatefulWidget {
  const FridgeBigDivider({super.key});

  @override
  State<FridgeBigDivider> createState() => _FridgeBigDividerState();
}

class _FridgeBigDividerState extends State<FridgeBigDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          TextButton(onPressed: null, child: Text("종합")),
          TextButton(onPressed: null, child: Text("육류")),
          TextButton(onPressed: null, child: Text("채소")),
          TextButton(onPressed: null, child: Text("유제품")),
        ],
      ),
    ));
  }
}
