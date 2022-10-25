import 'package:flutter/material.dart';

class PlayPage extends MaterialPageRoute<void> {
  PlayPage()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).accentColor,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
                child: Text('Back home'),
              ),
            ),
          );
        });
}