import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_favorite_word/getx/select_controller.dart';

class GetxMyWordList extends StatelessWidget {
  const GetxMyWordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Word List'),
      ),
      body: GetBuilder<SelectController>(
        init: SelectController(),
        builder: (_) =>ListView.builder(
            itemCount: Get.find<SelectController>().selectWords.length,
            itemBuilder: (context, index) {
              WordPair selectWord =
              Get.find<SelectController>().selectWords.toList()[index];
              return ListTile(
                  onTap: () {
                    Get.find<SelectController>().toggleSelect(
                        selectWord);
                  },
                  title: Text(
                    selectWord
                        .asString,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.favorite, color: Colors.red));
            })
      ),
    );
  }
}
