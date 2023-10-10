import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'typing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COMP3900',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFBE830E)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ANU Academic Advisory Chatbot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MsgType {
  bool bot;
  String text;
  MsgType(this.bot, this.text);
}

class _MyHomePageState extends State<MyHomePage> {
  final _history = <MsgType>[];
  final _suggestions = <String>[
    "I am considering a change to program.",
    "I am considering a change to major."
  ];

  final _suggestion1 = "I am considering a change to program.";
  final _suggestion2 = "I am considering a change to major.";

  // TODO: On first interaction let the student choose a major

  // TODO: Have free form chat box that takes suggestions for things to help with

  // TODO: Multi lingual

  bool _isSomeoneTyping = false;

  void _clearHistory() {
    setState(() {
      _history.clear();

      _appendHistory(
          MsgType(true, "Hi <name>, I've pulled up your academic history."));
      _appendHistory(MsgType(true,
          "I can see that you're enrolled in <program> and have plans to major in <major>."));
      _appendHistory(MsgType(true, "What can I help you with?"));

      Future.delayed(const Duration(milliseconds: 1000), () {
        _appendHistory(
            MsgType(false, "I am considering a change to my academic plans."));
      });

      Future.delayed(const Duration(milliseconds: 2000), () {
        _appendHistory(MsgType(
            true, "Which part of your plans are you considering changing?"));
      });
    });
  }

  void _appendHistory(MsgType msg) {
    setState(() {
      _history.add(msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    _clearHistory();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(16),
              child: Center(
                child: CupertinoSwitch(
                  onChanged: (newValue) {
                    setState(() {
                      _isSomeoneTyping = newValue;
                    });
                  },
                  value: _isSomeoneTyping,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: 3,
                reverse: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: FakeMessage(isBig: index.isOdd),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: TypingIndicator(
                showIndicator: _isSomeoneTyping,
              ),
            ),
            for (var msg in _history) MsgLine(msg: msg),
            for (var sug in _suggestions) SuggestionLine(suggestion: sug),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearHistory,
        tooltip: 'Start again',
        child: const Icon(Icons.undo),
      ),
    );
  }
}

class SuggestionLine extends StatelessWidget {
  const SuggestionLine({
    super.key,
    required String suggestion,
  }) : _suggestion = suggestion;

  final String _suggestion;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final style = theme.textTheme.bodyLarge!.copyWith(
    //   color: theme.colorScheme.secondary,
    // );

    return Padding(
      padding:
          const EdgeInsets.only(top: 2, bottom: 2, left: 45.0, right: 75.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            print(_suggestion);

            // TODO: clear the options
            // TODO: commit the selected option as user chat input
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4, bottom: 4, left: 10.0, right: 10),
              child: Text(
                _suggestion,
                style: const TextStyle(color: Colors.blueAccent, fontSize: 16),
                // style: style,
              ),
            ),
          ),
        ),
      ),
    );
  }
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
