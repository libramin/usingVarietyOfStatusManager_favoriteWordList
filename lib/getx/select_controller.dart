import 'package:english_words/english_words.dart';
import 'package:get/get.dart';

class SelectController extends GetxController{
  final Set<WordPair> _selectWords = {};

  void toggleSelect(WordPair selectWord){
    if(_selectWords.contains(selectWord)){
      _selectWords.remove(selectWord);
    }else{
      _selectWords.add(selectWord);
    }
    update();
  }

  bool alreadyContain (WordPair wordPair){
    return _selectWords.contains(wordPair);
  }

  Set<WordPair> get selectWords => _selectWords;
}

