import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final BoxDecoration shadowBox = BoxDecoration(
  color: Colors.white70,
  boxShadow: [
    BoxShadow(
      color: Colors.deepPurple.shade100.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ],
  borderRadius: const BorderRadius.all(Radius.circular(10)),
);
