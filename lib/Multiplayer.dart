import 'package:flutter/material.dart';
import 'GenerateRapperWidget.dart';

List<String> players = [];

class Multiplayer extends StatefulWidget {
  const Multiplayer({super.key});
  @override
  State<Multiplayer> createState() => _MultiplayerState();
}

class _MultiplayerState extends State<Multiplayer> {
  final TextEditingController _textController = TextEditingController();

  void _addPlayer() {
    if (players.length == 3) {
      _showMaxPlayersReachedDialog();
    } else {
      setState(() {
        if (_textController.text.isNotEmpty) {
          players.add(_textController.text);
          _textController.clear();
        }
      });
    }
  }

  void _showMaxPlayersReachedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AlertDialog(
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  1),
              title: const Text(""),
              backgroundColor: const Color.fromRGBO(255, 250, 226, 1),
              content: const Text("\nERREUR :\n\n 3 joueurs maximum.",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontFamily: "Roboto"),
                  textAlign: TextAlign.center),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    GlobalData.buttonPlayer.play(GlobalData.buttonSound);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Positioned(
              top: 240,
              child: Image.asset('assets/images/logo.png', height: 70),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Entre ton nom',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add, size: 30),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _addPlayer();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 270,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: players.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListBody(
                      children: [
                        SizedBox(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: index == 1
                                ? Colors.amberAccent
                                : index == 2
                                    ? Colors.orange[200]
                                    : Colors.red[300],
                            child: ListTile(
                              title: Text(
                                players[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Cool',
                                  color: Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete,
                                    size: 25, color: Colors.white60),
                                onPressed: () {
                                  setState(() {
                                    players.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
