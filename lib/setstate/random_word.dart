import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_favorite_word/setstate/select_word_list.dart';

final Set<WordPair> setSateSelectWords = {};

class SetSateRandomWord extends StatefulWidget {
  const SetSateRandomWord({Key? key}) : super(key: key);

  @override
  State<SetSateRandomWord> createState() => _SetSateRandomWordState();
}

class _SetSateRandomWordState extends State<SetSateRandomWord> {
  final List<WordPair> randomWords = generateWordPairs().take(25).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Random Word'),
          actions: [
            IconButton(onPressed: ()async{
              await Navigator.push(context, MaterialPageRoute(builder: (_)=>SetSateMyWordList()));
              setState(() { });
            }, icon: const Icon(CupertinoIcons.list_bullet))
          ],
        ),
        body: ListView.builder(
            itemCount: randomWords.length,
            itemBuilder: (context, index) {
              bool isSelect = setSateSelectWords.contains(randomWords[index]);
              return ListTile(
                  onTap: () {
                    setState(() {
                      if (isSelect) {
                        setSateSelectWords.remove(randomWords[index]);
                      } else {
                        setSateSelectWords.add(randomWords[index]);
                      }
                    });
                  },
                  title: Text(
                    randomWords[index].asString,
                    style: TextStyle(
                        fontWeight: isSelect
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                  trailing: Icon(
                    isSelect
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: isSelect
                        ? Colors.red
                        : Colors.black87,
                  ));
            }));
  }
}
