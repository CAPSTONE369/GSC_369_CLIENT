import 'package:client/src/features/food_fridge/widgets/fridge_appbar.dart';
import 'package:client/src/features/food_fridge/widgets/fridge_big_divider.dart';
import 'package:client/src/features/food_fridge/widgets/fridge_small_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                Container(
                  alignment: Alignment.centerLeft,
                  height: 70,
                  color: const Color(0xffFDFCFF),
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: const CircleAvatar(
                        backgroundColor: Color(0xffE6E6E6),
                        radius: 17,
                        child: Icon(
                          Icons.person,
                          color: Color(0xffCCCCCC),
                        ),
                      ),
                    ),
                    Container(
                        width: 210,
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "감자밥바라나난",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "3일 전",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        )),
                    Container(
                      child: IconButton(
                        icon: const Icon(Icons.delete_outline_rounded),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: const Icon(Icons.create_outlined),
                        onPressed: () {},
                      ),
                    )
                  ]),
                )
              ]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const ColoredBox(
                    color: Color(0xffFDFCFF), child: SizedBox(height: 5)),
          )),
        ],
      )),
    );
  }
}
