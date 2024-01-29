import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_sheet/database/database_constant.dart';
import 'package:flutter_test_sheet/database/storage_manager.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    final calculations =
        StorageManager.readData(DatabaseConstant.answers) ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('History Screen')),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 10),
        itemCount: calculations.length,
        itemBuilder: (context, index) {
          return Text(
            '- ${calculations[index]}',
            style: const TextStyle(fontSize: 22),
          );
        },
      ),
    );
  }
}
