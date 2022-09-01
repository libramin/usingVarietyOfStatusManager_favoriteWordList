import 'package:flutter/material.dart';
import 'package:my_favorite_word/provider/select_notifier.dart';
import 'package:provider/provider.dart';

class SetStateMyWordList extends StatelessWidget {
  const SetStateMyWordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Word List'),
      ),
      body: ListView.builder(
          itemCount: context.watch<SelectNotifier>().selectWords.length,
          itemBuilder: (context, index) {
            return ListTile(
                onTap: () {
                  context.read<SelectNotifier>().toggleSelect(context
                      .read<SelectNotifier>()
                      .selectWords
                      .toList()[index]);
                },
                title: Text(
                  context.read<SelectNotifier>().selectWords.toList()[index].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.favorite, color: Colors.red));
          }),
    );
  }
}
