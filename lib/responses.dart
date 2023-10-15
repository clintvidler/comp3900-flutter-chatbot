import 'message.dart';

List<Message> botResponse(String text) {
  var res = <Message>[];

  // Greet
  if (text.toLowerCase().contains("hello")) {
    res.add(ServerMessage(text: "Hello, Student Name!"));
  }

  // Farewell
  else if (text.toLowerCase().contains("bye")) {
    res.add(ServerMessage(text: "Thanks!"));
    res.add(ServerMessage(text: "Cya!"));
  }

  // I want to check my credit now
  else if (text.toLowerCase().contains("credit") ||
      text.toLowerCase().contains("check my credits")) {
    res.add(ServerMessage(
        text: "I just checked that you finished courses worth <number> credits"));
    res.add(ServerMessage(text: "I can help you make further dicisions."));
  }

  // I am considering a change to my academic plans.
  else if (text.toLowerCase().contains("change plans") ||
      text.toLowerCase().contains("change my plans")) {
    res.add(ServerMessage(
        text: "Which part of your plans are you considering changing?"));
    res.add(ServerMessage(text: "I can help plan your program or major."));
  }

  // I am considering a change to program.
  else if (text.toLowerCase().contains("change program") ||
      text.toLowerCase().contains("change my program")) {
    res.add(ServerMessage(
        text: "Which program are you interested in changing to?"));
  }

  // I am considering a change to major.
  else if (text.toLowerCase().contains("change major") ||
      text.toLowerCase().contains("change my major")) {
    res.add(ServerMessage(
        text:
            "Based on your academic history, you already have credits toward the following majors:"));
    res.add(ServerMessage(text: "Computer Science (6/8 courses)"));
    res.add(ServerMessage(text: "Software Development (4/8 courses)"));
  }

  // I would like help selecting courses to enrol in this semester.
  else if (text.toLowerCase().contains("this semester")) {
    res.add(ServerMessage(
        text:
            "I can help you choose what to enrol in this semester, here’s a list of the courses that I think you should consider:"));
    res.add(ServerMessage(
        text:
            " - COMP3120 - This course is a prerequisite for COMP4130, which is a requirement of your planned major in ‘Software Development’. Both of these courses are only offered in the first semester of a given year so if you leave it too late you may find yourself having to delay graduation or forgo this major."));
    res.add(ServerMessage(
        text:
            " - SOMECOURSE, SOMEOTHERCOURSE - These courses don’t have any prerequisites (or you meet them), and they all have very high SELT scores. If any of them interest you, you’ll be likely to have a good time there."));
  }

  // Placeholder
  else if (text.toLowerCase().contains("zzz")) {
    res.add(ServerMessage(text: "..."));
  }

  // Help
  else if (text.toLowerCase().contains("help")) {
    res.add(ServerMessage(text: "I can help with (keywords): "));
    res.add(ServerMessage(text: " - change plans"));
    res.add(ServerMessage(text: " - change program"));
    res.add(ServerMessage(text: " - change major"));
    res.add(ServerMessage(text: " - this semester"));
  }

  // Unknown
  else {
    res.add(ServerMessage(
        text:
            "I don't know how to respond to that, I'll pass your message along to my creator!"));
  }

  return res;
}
