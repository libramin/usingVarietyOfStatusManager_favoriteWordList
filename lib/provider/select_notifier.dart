import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

class SelectNotifier with ChangeNotifier{
  final Set<WordPair> _selectWords = {};

  void toggleSelect(WordPair selectWord){
    if(_selectWords.contains(selectWord)){
      _selectWords.remove(selectWord);
    }else{
      _selectWords.add(selectWord);
    }
    notifyListeners();
  }

  bool alreadyContain (WordPair wordPair){
    return _selectWords.contains(wordPair);
  }

  void clearSelectWords (){
    _selectWords.clear();
  }


  Set<WordPair> get selectWords => _selectWords;
}