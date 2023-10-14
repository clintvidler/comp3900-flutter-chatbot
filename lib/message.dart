import 'package:flutter/material.dart';

class Message {
  String text;

  Message(this.text);

  Widget widget() {
    return Text(text);
  }
}

class ServerMessage extends Message {
  ServerMessage({required text}) : super(text);

  @override
  Widget widget() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 1, bottom: 1, left: 15.0, right: 75.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4, bottom: 4, left: 10.0, right: 10),
              child: Text(
                text,
                // style: Theme.of(context).textTheme.bodyLarge,
              ),
            )),
      ),
    );
  }
}

class ClientMessage extends Message {
  ClientMessage({required text}) : super(text);

  @override
  Widget widget() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 1, bottom: 1, left: 75.0, right: 15.0),
      child: Align(
        alignment: Alignment.topRight,
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4, bottom: 4, left: 10.0, right: 10),
              child: Text(
                text,
                // style: Theme.of(context).textTheme.bodyLarge,
              ),
            )),
      ),
    );
  }
}
