import 'package:flutter/material.dart';
import 'dart:io';

import 'responses.dart';
import 'message.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  final ListModel _listNotifier = ListModel();

  final myController = TextEditingController();
  
  List<Message> _savedMessages = [];
  bool _showLoadButton = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            if (_showLoadButton)
                ElevatedButton(
                onPressed: () {
                  for (var message in _savedMessages) {
                  _listNotifier.add(message);
                  }
                  setState(() {
                  _showLoadButton = false; 

                });
                },
                child: Text("Load Saved Messages."),               
              ),
            ListBody(listNotifier: _listNotifier),


            Align(
              alignment: Alignment.bottomCenter, 
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ElevatedButton(
                    onPressed: () {
                    final presetMessage = "I want to change my major";
                    _listNotifier.add(ClientMessage(text: presetMessage));
                    for (var res in botResponse(presetMessage)) {
                    _listNotifier.add(res);
                    }
                    },
                    child: Text("I want to change my major"),
                  ),
                  SizedBox(width: 10), 
                  ElevatedButton(
                    onPressed: () {
                    final presetMessage = "I want to check my credit";
                    _listNotifier.add(ClientMessage(text: presetMessage));
                    for (var res in botResponse(presetMessage)) {
                      _listNotifier.add(res);
                    }
                  },
                  child: Text("I want to check my credit"),
                ),
              ],
            ),
            SizedBox(height: 10), 
          
            ],
          ),
        ),


          
            
            const SizedBox(
              width: 15,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                // padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                // height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                              controller: myController,
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {
                                _listNotifier.add(
                                    ClientMessage(text: myController.text));
                                for (var res in botResponse(myController.text))
                                  _listNotifier.add(res);
                              },
                              decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle:
                                    const TextStyle(color: Colors.black54),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () {
                                    _listNotifier.add(
                                        ClientMessage(text: myController.text));
                                    for (var res
                                        in botResponse(myController.text)) {
                                      _listNotifier.add(res);
                                    }
                                  },
                                ),
                              ))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      

      floatingActionButton: FloatingActionButton( 
        onPressed: () {
        _savedMessages = List.from(_listNotifier.values); 
        _listNotifier.clear();
        setState(() {
          _showLoadButton = true; 
        });
     },
        tooltip: 'Start again',
        child: Icon(Icons.undo),
    ));
  }
}

class ListModel with ChangeNotifier {
  final List<Message> _values = <Message>[
    ServerMessage(text: "Hi, Student"),
    ServerMessage(text: "I have pulled up your academic history."),
    ServerMessage(
        text:
            "I can see that you’re enrolled in 'Bachelor of Advanced Computing (Honours)', and that you haven't specified any plans to major."),
    ServerMessage(text: "How can I help you today?"),
  ];

  List<Message> get values => _values.toList();

  void add(Message value) {
    _values.add(value);

    notifyListeners();
  }

  void clear() {
    _values.clear();

    notifyListeners();
  }
}

class ListBody extends StatelessWidget {
  const ListBody({super.key, required this.listNotifier});

  final ListModel listNotifier;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    void scrollDown() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
      );
    }

    return Expanded(
      child: ListenableBuilder(
        listenable: listNotifier,
        builder: (BuildContext context, Widget? child) {
          // We rebuild the ListView each time the list changes,
          // so that the framework knows to update the rendering.
          final List<Message> values = listNotifier.values; // copy the list

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              WidgetsBinding.instance.addPostFrameCallback((_) => scrollDown());

              return values[index].widget();
            },
            itemCount: values.length,
            controller: scrollController,
          );

          // MsgLine(msg: values[index])
        },
      ),
    );
  }
}
