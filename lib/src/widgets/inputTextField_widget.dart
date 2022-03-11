import 'package:catalogoclientes/src/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Widget inputTextWidget(
  IconData icon,
  String hint,
  double top,
  TextEditingController controller,
  bool isPassword,
  bool readOnly,
  TextInputType textInputType,
  int max
) {
  return Container(
    height: 50.0,
    child: Row(
      children: <Widget>[
        Container(
          width: 50.0,
          child: Icon(
            icon,
            size: 25.0,
            color: Color(int.parse('0xFF9FADBD')),
          ),
        ),
        Expanded(
          child: Container(
            child: TextField(
              inputFormatters: [LengthLimitingTextInputFormatter(max),],
              expands: false,
              readOnly: readOnly,
              keyboardType: textInputType,
              obscureText: (isPassword) ? true : false,
              controller: controller,
              style: TextStyle(
                fontSize: 18,
                color:getColor('colorPrimary'),
              ),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 22),
                hintStyle: TextStyle(color: getColor('colorTextHint')),
                hintText: hint,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide.none,
                left: BorderSide(
                  color: Color(int.parse('0xFFDCDFE7')),
                  width: 1.0,
                ),
                bottom: BorderSide.none,
                right: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: Color(int.parse('0xFFDCDFE7')),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    margin: EdgeInsets.only(top: top, left: 15.0, right: 15.0),
    padding: EdgeInsets.all(0.75),
  );
}