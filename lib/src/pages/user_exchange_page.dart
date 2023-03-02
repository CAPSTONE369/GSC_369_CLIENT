import 'package:flutter/material.dart';

class UserExchangePage extends StatefulWidget {
  const UserExchangePage({super.key});

  @override
  State<UserExchangePage> createState() => _UserExchangePageState();
}

class _UserExchangePageState extends State<UserExchangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: const Text(
          "My Exchanges",
          style: TextStyle(
            color: const Color(0xff395BA9),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color(0xff44464F),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(
        child: Text("Exchange"),
      ),
    );
  }
}
