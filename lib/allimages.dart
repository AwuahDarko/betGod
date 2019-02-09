import 'package:flutter/material.dart';

class betGodLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage("images/logo.png");
    Image m_logo = Image(image: logo, height: 300.0);
    return Container(child: m_logo);
  }
}
