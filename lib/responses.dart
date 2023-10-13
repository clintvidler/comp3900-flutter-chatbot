import 'message.dart';

List<MsgType> botResponse(String text) {
  var res = <MsgType>[];

  // Greet
  if (text.toLowerCase().contains("hello")) {
    res.add(MsgType(true, "Hello, Student Name!"));
  }

  // Farewell
  else if (text.toLowerCase().contains("bye")) {
    res.add(MsgType(true, "Thanks!"));
    res.add(MsgType(true, "Cya!"));
  }

  // I am considering a change to my academic plans.
  else if (text.toLowerCase().contains("change my plans")) {
    res.add(MsgType(
        true, "Which part of your plans are you considering changing?"));
    res.add(MsgType(true, "I can help plan your program or major."));
  }

  // I am considering a change to program.
  else if (text.toLowerCase().contains("change program")) {
    res.add(MsgType(true, "Which program are you interested in changing to?"));
  }

  // I am considering a change to major.
  else if (text.toLowerCase().contains("change major")) {
    res.add(MsgType(true,
        "Based on your academic history, you already have credits toward the following majors:"));
    res.add(MsgType(true, "Computer Science (6/8 courses)"));
    res.add(MsgType(true, "Software Development (4/8 courses)"));
  }

  // I would like help selecting courses to enrol in this semester.
  else if (text.toLowerCase().contains("this semester")) {
    res.add(MsgType(true,
        "I can help you choose what to enrol in this semester, here’s a list of the courses that I think you should consider:"));
    res.add(MsgType(true,
        " - COMP3120 - This course is a prerequisite for COMP4130, which is a requirement of your planned major in ‘Software Development’. Both of these courses are only offered in the first semester of a given year so if you leave it too late you may find yourself having to delay graduation or forgo this major."));
    res.add(MsgType(true,
        " - SOMECOURSE, SOMEOTHERCOURSE - These courses don’t have any prerequisites (or you meet them), and they all have very high SELT scores. If any of them interest you, you’ll be likely to have a good time there."));
  }

  // Placeholder
  else if (text.toLowerCase().contains("zzz")) {
    res.add(MsgType(true, "..."));
  }

  // Help
  else if (text.toLowerCase().contains("help")) {
    res.add(MsgType(true, "I can help with (keywords): "));
    res.add(MsgType(true, " - academic plans"));
    res.add(MsgType(true, " - change program"));
    res.add(MsgType(true, " - change major"));
    res.add(MsgType(true, " - this semester"));
  }

  // Unknown
  else {
    res.add(MsgType(true,
        "I don't know how to respond to that, I'll pass your message along to my creator!"));
  }

  return res;
}
