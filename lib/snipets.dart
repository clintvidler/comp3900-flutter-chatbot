// Random sized boxes in place of text chat boxes, maybe for during load.

// Expanded(
//   child: ListView.builder(
//     padding: const EdgeInsets.symmetric(vertical: 8),
//     itemCount: 3,
//     reverse: true,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: const EdgeInsets.only(left: 100),
//         child: FakeMessage(isBig: index.isOdd),
//       );
//     },
//   ),
// ),

// A button

// ElevatedButton(
//   style: const ButtonStyle(
//     backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
//   ),
//   child: const Text('Let me play among the stars'),
//   onPressed: () {
//     _listNotifier.add(MsgType(false, "Testing..."));
//   },
// ),

// To toggle and show typing indicator

            // Container(
            //   color: Colors.grey,
            //   padding: const EdgeInsets.all(16),
            //   child: Center(
            //     child: CupertinoSwitch(
            //       onChanged: (newValue) {
            //         setState(() {
            //           _isSomeoneTyping = newValue;
            //         });
            //       },
            //       value: _isSomeoneTyping,
            //     ),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: TypingIndicator(
            //     showIndicator: _isSomeoneTyping,
            //   ),
            // ),

            