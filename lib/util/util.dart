import 'package:flutter/material.dart';

void justNavigate(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
