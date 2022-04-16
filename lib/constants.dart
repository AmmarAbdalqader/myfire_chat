import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type a message ...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

InputDecoration kInputFieldDecoration(String _hint, Color _color) {
  return InputDecoration(
    hintText: _hint,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: _color, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: _color, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
  );
}
