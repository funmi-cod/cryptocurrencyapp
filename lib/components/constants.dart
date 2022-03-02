import 'package:cryptocurrencyapp/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



const kBgColor = Color(0xFFFFFFFF);
const kTextColor = Color(0xFF0A0909);
const kPrimaryColor = Color(0xFFEDE4E3);
const kSubTextColor = Color(0xFF868686);
const kNotifyColor = Color(0xFFFE724C);
const kActiveColor = Color(0xFF008000);


final headingStyle = GoogleFonts.poppins(fontSize: getProportionateWidth(23), color: kTextColor, height: 1.0, fontWeight: FontWeight.bold);
final subHeadingStyle = GoogleFonts.openSans(fontSize: getProportionateWidth(15),color: kSubTextColor, );
final textStyle = GoogleFonts.poppins(fontSize: getProportionateWidth(15),color: kTextColor, );

final subTextStyle = GoogleFonts.poppins(fontSize: getProportionateWidth(10), color: kTextColor, fontWeight: FontWeight.bold);

final textErrorStyle = GoogleFonts.openSans(fontSize: getProportionateWidth(20),color: kNotifyColor, );

final inactiveTrailStyle = GoogleFonts.poppins(fontSize: getProportionateWidth(15),color: kNotifyColor, );

final activeTrailStyle = GoogleFonts.poppins(fontSize: getProportionateWidth(15),color: kActiveColor, );