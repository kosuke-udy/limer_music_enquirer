import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

class AppLogger {
  static const wrapWidth = 65;

  // Initialization of logger at app root
  static void init() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      // Divider
      _log("-" * wrapWidth);
      // _log("");

      // logger info
      final dateFormat = DateFormat('MM/dd HH:mm:ss');
      _log(
        '${record.loggerName} [${record.level.name} (${dateFormat.format(record.time)})]',
      );

      // message
      appPrint(record.message, object: record.object, indent: 1);

      // Divider
      // _log("");
    });
  }

  static void appPrint(
    String message, {
    int indent = 0,
    Object? object,
    bool forceWrap = false,
  }) {
    if (object.runtimeType == Null) {
      if (forceWrap && message.length > wrapWidth) {
        final wrapped = debugWordWrap(message, wrapWidth);
        if (wrapped.length > 1) {
          for (final line in wrapped) {
            appPrint(line, indent: indent, forceWrap: forceWrap);
          }
          return;
        } else {
          for (int i = 0; i < (message.length / wrapWidth); i++) {
            final end = min((i + 1) * wrapWidth, message.length - 1);
            appPrint(
              message.substring(i * wrapWidth, end),
              indent: indent,
              forceWrap: forceWrap,
            );
          }
          return;
        }
      }

      _log(message, isMessage: true, indent: indent);
      return;
    }

    if (object is IndentLog) {
      appPrint(
        object.message,
        object: object.object,
        indent: indent + object.indent,
        forceWrap: forceWrap,
      );
    } else if (object is List) {
      for (final item in object) {
        appPrint(
          "",
          object: item,
          indent: indent,
          forceWrap: forceWrap,
        );
      }
    } else if (object is Map<String, String>) {
      for (final key in object.keys) {
        final valueStr = object[key].toString();
        appPrint(
          '$key: $valueStr',
          indent: indent,
          forceWrap: forceWrap,
        );
      }
    } else {
      appPrint(
        object.toString(),
        indent: indent,
        forceWrap: forceWrap,
      );
    }
  }

  static void _log(String data, {bool isMessage = false, int indent = 0}) {
    if (kDebugMode) {
      late String out, indentStr;
      if (isMessage) {
        indentStr = '  ' * max((indent - 1), 0);
        out = '$indentStr- $data';
      } else {
        indentStr = '  ' * indent;
        out = '$indentStr$data';
      }
      // debugPrint(out, wrapWidth: wrapWidth);
      developer.log(out);
    }
  }

  static Logger get(String name) {
    return Logger(name);
  }

  // static Logger fromRef(Ref ref) {
  //   return Logger(ref.toString());
  // }

  // static Logger fromWidgetRef(WidgetRef ref) {
  //   return Logger(ref.toString());
  // }
}

class IndentLog {
  final String message;
  final Object? object;
  final int indent;
  final bool forceWrap;

  IndentLog(
    this.message, {
    this.object,
    this.indent = 0,
    this.forceWrap = false,
  });

  @override
  String toString() {
    if (object.runtimeType == Null) {
      return message;
    } else {
      return object.toString();
    }
  }
}
