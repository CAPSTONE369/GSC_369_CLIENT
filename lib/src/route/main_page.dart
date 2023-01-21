import 'package:client/src/features/food_fridge/fridge_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class Page {
  const Page(this.iconData, this.text);
  final IconData iconData;
  final String text;
}

class _MainPageState extends State<MainPage> {
  int idx = 0;

  final pageList = const <Page>[
    Page(Icons.home_filled, "fridgy"),
    Page(Icons.fastfood_rounded, "recipe"),
    Page(Icons.add_box_outlined, "modal"),
    Page(Icons.shopping_cart_rounded, "exchange"),
    Page(Icons.person, "setting"),
  ];

  final _buildBody = <Widget>[
    FridgePage(),
    FridgePage(),
    FridgePage(),
    FridgePage(),
    FridgePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: idx,
        onTap: (x) {
          setState(() {
            idx = x;
          });
        },
        elevation: 20.0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xff395BA9),
        items: pageList
            .map((Page page) => BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(page.iconData),
                label: page.text))
            .toList(),
      ),
      body: _buildBody[idx],
    );
  }
}
