import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class AnimalImage{
  final String path;
  final Color color;

  const AnimalImage.initialState()
    : path = "",
      color = Colors.white;

  const AnimalImage({ required this.path, required this.color});
}