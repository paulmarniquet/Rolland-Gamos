import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Multiplayer extends StatefulWidget {
  const Multiplayer({super.key});

  @override
  _MultiplayerState createState() => _MultiplayerState();
}

class _MultiplayerState extends State<Multiplayer> {
  List<String> players = [];
  final TextEditingController _textController = TextEditingController();

  void _addPlayer() {
    setState(() {
      players.add(_textController.text);
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.add),
              onPressed: _addPlayer,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return Text(players[index]);
            },
          ),
        ),
      ],
    );
  }
}
