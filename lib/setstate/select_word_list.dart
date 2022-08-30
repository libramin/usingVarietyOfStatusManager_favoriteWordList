import 'package:flutter/material.dart';
import 'package:my_favorite_word/setstate/random_word.dart';

class SetSateMyWordList extends StatefulWidget {
  const SetSateMyWordList({Key? key}) : super(key: key);

  @override
  State<SetSateMyWordList> createState() => _SetSateMyWordListState();
}

class _SetSateMyWordListState extends State<SetSateMyWordList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Word List'),
      ),
      body: ListView.builder(
        itemCount: setSateSelectWords.length,
          itemBuilder: (context,index){
        return ListTile(
            onTap: () {
              setState(() {
                setSateSelectWords.remove(setSateSelectWords.toList()[index]);
              });
            },
            title: Text(
              setSateSelectWords.toList()[index].asString,
              style: TextStyle(
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.favorite,
              color:  Colors.red
            ));
      }),
    );
  }
}
