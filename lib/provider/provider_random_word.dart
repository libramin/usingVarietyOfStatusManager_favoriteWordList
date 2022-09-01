import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_favorite_word/provider/provider_select_word_list.dart';
import 'package:my_favorite_word/provider/select_notifier.dart';
import 'package:provider/provider.dart';

class ProviderRandomWord extends StatelessWidget {
  const ProviderRandomWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SelectNotifier>().clearSelectWords();
    final List<WordPair> randomWords = generateWordPairs().take(25).toList();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Random Word'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SetStateMyWordList()));
                },
                icon: const Icon(CupertinoIcons.list_bullet))
          ],
        ),
        body: ListView.builder(
            itemCount: randomWords.length,
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () {
                    context
                        .read<SelectNotifier>()
                        .toggleSelect(randomWords[index]);
                  },
                  title: Text(
                    randomWords[index].toString(),
                    style: TextStyle(
                        fontWeight: context
                                .watch<SelectNotifier>()
                                .alreadyContain(randomWords[index])
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.favorite_outline,
                    color: context
                            .watch<SelectNotifier>()
                            .alreadyContain(randomWords[index])
                        ? Colors.red
                        : Colors.black87,
                  ));
            }));
  }
}
