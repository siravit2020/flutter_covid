import 'package:flutter/material.dart';



const c1 = Color(0xFF006d77);
const c2 = Color(0xFF83c5be);
const c3 = Color(0xFFedf6f9);
const c4 = Color(0xFFffddd2);
const c5 = Color(0xFFe29578);
const background = Color(0xffFFF8F6);
// Text Style
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

String comma(String msg){
  return msg.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}
