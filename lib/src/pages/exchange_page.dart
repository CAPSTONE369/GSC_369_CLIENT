import 'package:client/src/pages/user_exchange_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExchnagePage extends StatefulWidget {
  const ExchnagePage({super.key});

  @override
  State<ExchnagePage> createState() => _ExchnagePageState();
}

class _ExchnagePageState extends State<ExchnagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        elevation: 2,
        title: const Text(
          "Food Exchange",
          style: TextStyle(
            color: const Color(0xff395BA9),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const UserExchangePage())),
              icon: Icon(
                Icons.calendar_today,
                color: const Color(0xff395BA9),
              ))
        ],
      ),
      body: Center(
        child: Text("Exchange"),
      ),
    );
  }
}
