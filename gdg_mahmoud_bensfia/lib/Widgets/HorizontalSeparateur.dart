import 'package:flutter/material.dart';
import 'package:gdg_mahmoud_bensfia/Config/Constants.dart';

class HorizontalSeparateur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: 0.5,
      color: Constants.grey0,
    );
  }
}
