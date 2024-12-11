import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Desktop2 extends StatelessWidget {
  const Desktop2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              'assets/images/desk2.svg',
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
