import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest2/components/color.dart';

class Desktop7 extends StatefulWidget {
  final PageController pageController; // PageController 추가
  const Desktop7({
    super.key,
    required this.pageController, // 생성자에 추가
  });

  @override
  State<Desktop7> createState() => _Desktop7State();
}

class _Desktop7State extends State<Desktop7> {
  List<bool> _isExpanded = List.generate(6, (_) => false);
  bool isSwitched = false;

  final List<Map<String, String>> faqData = [
    {
      "question": "퀘스트스쿨에 대해 알고 싶어요.",
      "answer":
          "퀘스트스쿨은 모든 학생이 자신의 꿈을 향해 나아갈 수 있도록 돕는 교육 플랫폼입니다. 우리는 개별 맞춤형 학습과 진로 탐색을 통해 학생들의 잠재력을 최대한 끌어올리는 것을 목표로 합니다."
    },
    {
      "question": "수업은 어떤 방식으로 진행되나요?",
      "answer":
          "수업은 온라인과 오프라인을 병행하는 하이브리드 방식으로 진행됩니다. 학생들은 자신의 일정에 맞춰 온라인 강의를 수강할 수 있으며, 정기적인 오프라인 모임을 통해 심화 학습과 실전 연습을 진행합니다."
    },
    {
      "question": "수강 신청은 어떻게 하나요?",
      "answer":
          "홈페이지 상단의 '수강신청' 버튼을 클릭하시면 간단한 절차로 신청이 가능합니다. 추가 문의사항이 있으시다면 고객센터(1234-5678)로 연락 주시기 바랍니다."
    },
    {
      "question": "교육 과정의 특징은 무엇인가요?",
      "answer":
          "저희 교육 과정은 이론과 실습이 균형있게 구성되어 있으며, 학생 개개인의 수준과 목표에 맞춘 맞춤형 커리큘럼을 제공합니다. 또한 정기적인 피드백과 성과 분석을 통해 지속적인 성장을 지원합니다."
    },
    {
      "question": "수강료 환불 규정은 어떻게 되나요?",
      "answer":
          "수강 시작 후 7일 이내에는 전액 환불이 가능하며, 그 이후에는 잔여 수업 일수에 따라 환불액이 산정됩니다. 자세한 환불 규정은 홈페이지의 '이용약관'에서 확인하실 수 있습니다."
    },
    {
      "question": "온라인 강의는 언제까지 수강할 수 있나요?",
      "answer":
          "온라인 강의는 수강 신청일로부터 3개월간 무제한 수강이 가능합니다. 수강 기간 연장을 원하시는 경우, 고객센터를 통해 문의해 주시기 바랍니다."
    }
  ];

  void _toggleAll(bool value) {
    setState(() {
      isSwitched = value;
      _isExpanded = List.generate(6, (_) => value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: NotificationListener<ScrollNotification>(
        // 추가
        onNotification: (ScrollNotification scrollInfo) {
          // 수직 스크롤일 때만 처리하고, 페이지 스크롤은 무시
          if (scrollInfo.metrics.axis == Axis.vertical) {
            return true; // 수직 스크롤 이벤트 소비
          }
          return false; // 수평(페이지) 스크롤은 통과
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 80),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // 추가
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '자주 묻는 질문',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        const Text(
                          '전체 펼치기',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: isSwitched,
                            activeColor: Colors.white,
                            activeTrackColor: AppColor.font1,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey[300],
                            onChanged: _toggleAll,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 40),
                ...List.generate(
                  // ListView 대신 spread 연산자 사용
                  faqData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ExpansionTile(
                      key: Key(index.toString()),
                      initiallyExpanded: _isExpanded[index],
                      onExpansionChanged: (expanded) {
                        setState(() {
                          _isExpanded[index] = expanded;
                          isSwitched = _isExpanded.every((element) => element);
                        });
                      },
                      title: Text(
                        faqData[index]["question"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF93969B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              faqData[index]["answer"]!,
                              style: const TextStyle(
                                color: Colors.black,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
