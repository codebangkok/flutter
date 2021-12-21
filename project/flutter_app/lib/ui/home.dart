import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color.fromARGB(255, 0, 166, 230),
      child: Text(
        'ธนาคารกรุงไทย',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: 50.0,
          fontFamily: 'KrungthaiSmart',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
