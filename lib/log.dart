import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

enum LogMode {
  debug, // 💚 DEBUG
  warning, // 💛 WARNING
  info, // 💙 INFO
  error, // ❤️ ERROR
}

/*
* Log printing
* As with normal printing information, just pass in the content to be printed
* When outputting, the row and column where the print position is located will be output and displayed together
* In order to distinguish different information types, you can pass in LogMode, which is in the debug state by default
* */
String printf(dynamic msg, {LogMode mode = LogMode.debug}) {
  if (kReleaseMode) {
    // release mode does not print
    return "";
  }
  // Chain.forTrace(StackTrace.current);
  var chain = Chain.current();
  // Combine the stacks of core and fluent packages (there is only one piece of relevant data left)
  chain =
      chain.foldFrames((frame) => frame.isCore || frame.package == "flutter");
  // Take out all information frames
  final frames = chain.toTrace().frames;
  // Find the information frame of the current function
  final idx = frames.indexWhere((element) => element.member == "printf");
  if (idx == -1 || idx + 1 >= frames.length) {
    return "";
  }
  // Function information frame for calling the current function
  final frame = frames[idx + 1];

  var modeStr = "";
  switch (mode) {
    case LogMode.debug:
      modeStr = "💚 DEBUG";
      break;
    case LogMode.warning:
      modeStr = "💛 WARNING";
      break;
    case LogMode.info:
      modeStr = "💙 INFO";
      break;
    case LogMode.error:
      modeStr = "❤️ ERROR";
      break;
  }

  final msgInfo =
      "$modeStr ${frame.uri.toString().split("/").last}(${frame.line}-${frame.column}) - $msg";

  ///As flutter would like, it is currently only printed in debug mode
  if (kDebugMode) {
    print(msgInfo);
  }
  return msgInfo;
}
