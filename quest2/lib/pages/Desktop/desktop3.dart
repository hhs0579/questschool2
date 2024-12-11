import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest2/components/color.dart';

class Desktop3 extends StatelessWidget {
  const Desktop3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  '어떤 주제와 내용으로 상담을 신청할지 막막 하다면?',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 36,
                      color: Colors.black),
                ),
                const Text(
                  'AI 챗봇과 대화를 통해 해결해 보세요!',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 36,
                      color: AppColor.font1),
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset(
                    'assets/images/desk3.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
