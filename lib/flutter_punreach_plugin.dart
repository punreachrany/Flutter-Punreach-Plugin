
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class FlutterPunreachPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_punreach_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


}

class PunreachDialog{
  // Show Dialog
  static messageDialog(BuildContext context, String message) {
    // print("=== Utilities Method ===");
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          contentPadding: EdgeInsets.zero,
          //title: Center(child: Text("Picture")),
          content: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      message,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0),
                          ),
                          color: Color(0XFF8e44ad)),
                      alignment: Alignment.center,
                      height: 50,
                      //color: primaryColor,
                      child: Text(
                        "Okay",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PunreachButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final double height;
  final double cornerRadius;
  final Color borderColor;
  final TextStyle style;
  final VoidCallback onPressed;

  const PunreachButton({
    Key key,
    this.text,
    this.backgroundColor,
    this.height,
    this.cornerRadius,
    this.borderColor,
    this.style,
    this.onPressed
  }) : super(key: key);




  @override
  _PunreachButtonState createState() => _PunreachButtonState(
    text,
    backgroundColor,
    height,
    cornerRadius,
    borderColor,
    style,
    onPressed
  );
}

class _PunreachButtonState extends State<PunreachButton> {
  final String text;
  final Color backgroundColor;
  final double height;
  final double cornerRadius;
  final Color borderColor;
  final TextStyle style;
  final VoidCallback onPressed;
  _PunreachButtonState(
    this.text,
    this.backgroundColor,
    this.height,
    this.cornerRadius,
    this.borderColor,
    this.style,
    this.onPressed
);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
            side: BorderSide(color: borderColor)),
        onPressed: onPressed,
        padding: EdgeInsets.all(10.0),
        color: backgroundColor,
        textColor: Colors.white,
        child: Text(text,
            style: style),
      ),
    );

  }
}



