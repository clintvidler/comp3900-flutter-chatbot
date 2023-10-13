import 'package:flutter/material.dart';

class MsgType {
  bool bot;
  String text;
  MsgType(this.bot, this.text);
}

class MsgLine extends StatelessWidget {
  const MsgLine({
    super.key,
    required this.msg,
  });

  final MsgType msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 1,
          bottom: 1,
          left: msg.bot ? 15.0 : 75.0,
          right: msg.bot ? 75.0 : 15.0),
      child: Align(
        alignment: msg.bot ? Alignment.topLeft : Alignment.topRight,
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: msg.bot ? Colors.grey[300] : Colors.blue[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4, bottom: 4, left: 10.0, right: 10),
              child: Text(
                msg.text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )),
      ),
    );
  }
}
