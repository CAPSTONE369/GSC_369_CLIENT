import 'dart:convert';

import 'package:client/src/model/page/fridge_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../widgets/fridge/fridge_appbar.dart';
import '../widgets/fridge/fridge_big_divider.dart';
import '../widgets/fridge/fridge_food_card.dart';
import '../widgets/fridge/fridge_small_divider.dart';
import 'package:http/http.dart' as http;

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  late FridgePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  List info = [];

  @override
  void initState() {
    super.initState();
    loadingFoodInfo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadingFoodInfo();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  static final storage = FlutterSecureStorage();

  void loadingFoodInfo() async {
    print("api called");
    final apiUrl = Uri.https('api.zefridge.xyz', 'food/fridge/1');
    final Map<String, String> tokens = await storage.readAll();
    print(tokens['accessToken']);
    var foodInfo = await http.get(
      apiUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": tokens['accessToken'].toString()
      },
    );
    setState(() {
      info = jsonDecode(utf8.decode(foodInfo.bodyBytes));
    });
    print(info[info.length - 1].toString());
  }

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
              itemCount: info.length,
              itemBuilder: (BuildContext context, int idx) {
                print(info[idx]["name"]);
                return Column(children: <Widget>[
                  FridgeFoodCard(
                      name: info[idx]["name"],
                      expiryDate: info[idx]["expiryDate"]),
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
