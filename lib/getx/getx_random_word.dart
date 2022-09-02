import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_favorite_word/getx/select_controller.dart';

import 'getx_select_word_list.dart';

class GetxRandomWord extends StatelessWidget {
  const GetxRandomWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WordPair> randomWords = generateWordPairs().take(25).toList();
    // SelectController controller = Get.put(SelectController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Random Word'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const GetxMyWordList()));
                },
                icon: const Icon(CupertinoIcons.list_bullet))
          ],
        ),
        body: GetBuilder<SelectController>(
          init: SelectController(),
          builder: (_) => ListView.builder(
              itemCount: randomWords.length,
              itemBuilder: (context, index) {
                bool alreadyContain = Get.find<SelectController>()
                    .alreadyContain(randomWords[index]);
                return ListTile(
                    onTap: () {
                      Get.find<SelectController>()
                          .toggleSelect(randomWords[index]);
                    },
                    title: Text(
                      randomWords[index].asString,
                      style: TextStyle(
                          fontWeight: alreadyContain
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                    trailing: Icon(
                      alreadyContain
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: alreadyContain
                          ? Colors.red
                          : Colors.black87,
                    ));
              }),
        ));
  }
}
