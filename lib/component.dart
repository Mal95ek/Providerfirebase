import 'package:flutter/material.dart';

Widget defultTextButton({
  required function,
  required text,
  Color background = Colors.deepOrangeAccent,
}) =>
    MaterialButton(
      onPressed: function,
      child: text,
      color: background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    );
