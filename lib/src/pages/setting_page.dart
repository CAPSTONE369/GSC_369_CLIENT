import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Setting",
            style: TextStyle(
              color: const Color(0xff395BA9),
            ),
          )),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 70, bottom: 40, left: 10, right: 10),
            alignment: Alignment.center,
            height: 200,
            child: const Text("sunnyineverywhere@ewhain.net"),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xff395BA9),
                  width: 5,
                )),
          ),
          Expanded(
              child: SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, idx) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Text Button',
                        style: TextStyle(
                            color: Color(0xff395BA9),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
          ))
        ],
      )),
    );
  }
}
