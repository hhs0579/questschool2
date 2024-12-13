import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quest2/components/color.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PhonePage extends StatefulWidget {
  final YoutubePlayerController youtubeController;
  const PhonePage({
    Key? key,
    required this.youtubeController,
  }) : super(key: key);

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // 외부 브라우저에서 열기
        webOnlyWindowName: '_blank', // 웹에서 새 탭으로 열기
      );
    } catch (e) {
      print('URL 실행 중 오류 발생: $e');
    }
  }

  bool a = true;
  bool b = false;
  bool c = false;
  bool d = false;
  @override
  void initState() {
    super.initState();
    // 컨트롤러 초기화
  }

  // 다이얼로그 표시 함수
  void _showVideoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: true, // 다이얼로그 바깥을 누르면 닫기
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // 다이얼로그 모서리 둥글게
          ),
          child: SizedBox(
            width: 720,
            height: 540,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent, // 다이얼로그 배경색
                borderRadius: BorderRadius.circular(16),
              ),
              child: YoutubePlayer(
                controller: YoutubePlayerController.fromVideoId(
                  videoId: '2o1Jdbs9Ll4',
                  params: const YoutubePlayerParams(
                    showControls: true,
                    showFullscreenButton: true,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<bool> _isExpanded = List.generate(6, (_) => false);
  bool isSwitched = false;

  final List<Map<String, String>> faqData = [
    {
      "question": "퀘스트스쿨은 어떻게 접속할 수 있나요?",
      "answer":
          "퀘스트스쿨(for 학생)은 앱(어플)이 아닙니다. 선생님께서알려주신 QR코드를 스캔하여 접속하거나\nstudent.questschool.kr 로 접속할 수 있습니다."
    },
    {
      "question": "상담은 온라인으로 진행되나요?",
      "answer":
          "퀘스트스쿨은 상담 신청을 도와주는 서비스로, 실제 상담은 선생님께서 지정해 주신 장소에서 오프라인으로 진행됩니다."
    },
    {
      "question": "퀘스트스쿨에 가입을 해야 하나요?",
      "answer":
          "네. 회원가입을 완료해야 퀘스트스쿨을 이용할 수 있습니다.\n* 회원가입 시 선생님께서 알려주신 '학교코드'를 입력해야 우리 학교에 등록이 됩니다. 학교코드 미입력 시 회원가입이 불가합니다."
    },
    {
      "question": "개인정보와 상담 정보는 보호가 되나요?",
      "answer":
          "개인정보(이름, 학년 반 번, 이메일주소)는 우리 학교 선생님만 확인 가능합니다.\n상담 신청 내역은 내가 상담을 신청한 선생님만 확인 가능하며, (상담을 AI 대화형으로 진행했을 경우)AI 챗봇 대화 내역이 선생님께 전달되지 않기를 원한다면 미동이를 선택해 주세요. 미동의 시, 선생님께는 상담 주제만 전달됩니다.\n*개인정보와 상담 정보는 보안 시스템이 적용되어 안전하게 보호됩니다."
    },
    {
      "question": "상담 신청 승인은 어떻게 알 수 있나요?",
      "answer":
          "상담 신청 시 선택했던 선생님께서 상담을 승인하면 카카오톡으로 알림톡이 전달됩니다.\n알림톡에서는 상담 신청한 내용과 함께 선생님께서 남겨주신 메시지가 표시됩니다. 메시지를 확인하여 상담 전 필요한 것들을 준비할 수 있도록 합니다."
    },
  ];

  void _toggleAll(bool value) {
    setState(() {
      isSwitched = value;
      _isExpanded = List.generate(6, (_) => value);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            //1번

            Container(
              color: const Color(0xffFFF1B2),
              // 최소 높이를 화면 높이로 설정

              height: MediaQuery.of(context).size.height,

              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      // 전체 화면을 채우는 SVG 배경

                      child: Image.asset(
                        'assets/images/pdesk1.png', // SVG 파일 경로
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 89,
                          ),
                          Container(
                            width: 259,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: const Center(
                              child: Text(
                                '상담 신청이 이렇게 쉽다고?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            '교내 진로진학 상담 솔루션',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 36),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 304,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            '퀘스트스쿨은 PC(교사용)와 모바일(학생용)을 통해',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          const Text(
                            '쉽고 간편하게 진로진학 상담 스케줄링이 가능합니다!',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () =>
                                _launchURL('https://aboutquestschool.kr/'),
                            child: Container(
                              height: 52,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/logo2.svg',
                                    width: 120,
                                    height: 14,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Center(
                                    child: Text(
                                      '바로가기',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //2번
            Container(
              color: const Color(0xff1E1E1E),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                'assets/images/pdesk2.svg',
                fit: BoxFit.contain,
              ),
            ),

            //3번

            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '어떤 주제와 내용으로',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const Text(
                    '상담을 신청할지 막막 하다면?',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const Text(
                    'AI 챗봇과 대화를 통해 해결해 보세요!',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: AppColor.font1),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                      'assets/images/phone1.png',
                      fit: BoxFit.contain,
                      scale: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: AppColor.font1),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    '고민이나 도움이 필요한 점을',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const Text(
                    '채팅창에 입력하고,',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                      'assets/images/phone2.png',
                      fit: BoxFit.contain,
                      scale: 0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: AppColor.font1),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'AI와 대화하며',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const Text(
                    '구체적인 상담 주제를 찾아봐요!',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            //4번

            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    '퀘스트스쿨이 ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                  const Text(
                    '특별한 3가지 이유',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColor.font1),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset(
                      'assets/images/pdesk4.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            //5번
            Container(
                color: const Color(0xffFFF1B2),
                child: Stack(children: [
                  // 전체 화면을 채우는 SVG 배경
                  Image.asset(
                    'assets/images/pback1.png', // SVG 파일 경로
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    scale: 0.1,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            '상담 예약부터',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          const Text(
                            '상담 기록 관리, 결과보고서까지',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          const Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: '퀘스트 스쿨 ',
                                      style: TextStyle(color: AppColor.font1)),
                                  TextSpan(text: '하나로 끝!')
                                ]),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () => _showVideoDialog(context),
                            child: Container(
                              width: 215,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.font1,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  '튜토리얼 영상 보기',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 56,
                          ),
                          a
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffDFDFDF)),
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                              color: AppColor.font1,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColor.font1
                                                      .withOpacity(0.4),
                                                  spreadRadius: 5,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Container(
                                            height: 312,
                                            width: 2,
                                            color: AppColor.font1,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '상담 주제 선정하기',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff414042),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99)),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'AI대화형 상담내용 입력하기',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Color(0xff414042)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff414042),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99)),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text.rich(
                                                TextSpan(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Color(0xff414042)),
                                                  children: [
                                                    TextSpan(
                                                        text: '선택형 상담내용 입력하기'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 14,
                                          ),
                                          SizedBox(
                                              width: 250,
                                              height: 244.5,
                                              child: Image.asset(
                                                'assets/images/phone_1.png',
                                                fit: BoxFit.contain,
                                              )),
                                        ],
                                      ),
                                    ]),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = !a;
                                          b = false;
                                          c = false;
                                          d = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffDFDFDF)),
                                                borderRadius:
                                                    BorderRadius.circular(99),
                                                color: Colors.transparent),
                                          ),
                                          const SizedBox(height: 16),
                                          Container(
                                            height: 36,
                                            width: 2,
                                            color: const Color(0xff93969B),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '상담 주제 선정하기',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff93969B)),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = !a;
                                          b = false;
                                          c = false;
                                          d = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: Color(0xff93969B),
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          b
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffDFDFDF)),
                                                borderRadius:
                                                    BorderRadius.circular(99),
                                                color: AppColor.font1,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColor.font1
                                                        .withOpacity(0.4),
                                                    spreadRadius: 5,
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Container(
                                              height: 312,
                                              width: 2,
                                              color: AppColor.font1,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              '상담 신청하기',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 8),
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff414042),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99)),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xff414042)),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '원하는 담당 선생님 선택하기\n'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 8),
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff414042),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99)),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xff414042)),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '원하는 날짜와 시간 선택하기'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            SizedBox(
                                                width: 250,
                                                height: 244.5,
                                                child: Image.asset(
                                                  'assets/images/phone_2.png',
                                                  fit: BoxFit.contain,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = false;
                                          b = !b;
                                          c = false;
                                          d = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFDFDF)),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  color: Colors.transparent),
                                            ),
                                            const SizedBox(height: 16),
                                            Container(
                                              height: 36,
                                              width: 2,
                                              color: const Color(0xff93969B),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '상담 신청하기',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff93969B)),
                                            ),
                                            SizedBox(height: 16),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = false;
                                          b = !b;
                                          c = false;
                                          d = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: Color(0xff93969B),
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          c
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffDFDFDF)),
                                                borderRadius:
                                                    BorderRadius.circular(99),
                                                color: AppColor.font1,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColor.font1
                                                        .withOpacity(0.4),
                                                    spreadRadius: 5,
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Container(
                                              height: 312,
                                              width: 2,
                                              color: AppColor.font1,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              '마이페이지',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 8),
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff414042),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99)),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xff414042)),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '학생에 대한 내용을 통해 진로\n'),
                                                      TextSpan(text: '진학 용이'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            SizedBox(
                                                width: 250,
                                                height: 244.5,
                                                child: Image.asset(
                                                  'assets/images/phone_3.png',
                                                  fit: BoxFit.contain,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = false;
                                          b = false;
                                          c = !c;
                                          d = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFDFDF)),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  color: Colors.transparent),
                                            ),
                                            const SizedBox(height: 16),
                                            Container(
                                              height: 36,
                                              width: 2,
                                              color: const Color(0xff93969B),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '마이페이지',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff93969B)),
                                            ),
                                            SizedBox(height: 16),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = false;
                                          b = false;
                                          c = !c;
                                          d = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: Color(0xff93969B),
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          d
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffDFDFDF)),
                                                borderRadius:
                                                    BorderRadius.circular(99),
                                                color: AppColor.font1,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColor.font1
                                                        .withOpacity(0.4),
                                                    spreadRadius: 5,
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Container(
                                              height: 312,
                                              width: 2,
                                              color: AppColor.font1,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              '진로심리검사',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 8),
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff414042),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99)),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xff414042)),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '커리어넷에서 제공하는 검사 진행가능\n'),
                                                      TextSpan(text: '(3가지)'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 8),
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff414042),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99)),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xff414042)),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '모바일로 쉽게 진행하고 결과 전송\n'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            SizedBox(
                                                width: 250,
                                                height: 244.5,
                                                child: Image.asset(
                                                  'assets/images/phone_4.png',
                                                  fit: BoxFit.contain,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = false;
                                          b = false;
                                          c = false;
                                          d = !d;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFDFDF)),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  color: Colors.transparent),
                                            ),
                                            const SizedBox(height: 16),
                                            Container(
                                              height: 36,
                                              width: 2,
                                              color: const Color(0xff93969B),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '상담 후 내용 정리',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff93969B)),
                                            ),
                                            SizedBox(height: 16),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          a = false;
                                          b = false;
                                          c = false;
                                          d = !d;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: Color(0xff93969B),
                                      ),
                                    ),
                                  ],
                                ),
                        ]),
                  ),
                ])),

            SizedBox(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/back1.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity, // 추가: 전체 너비 사용
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // 이미 있음
                      mainAxisAlignment: MainAxisAlignment.start, // 추가: 세로 정렬
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: '퀘스트스쿨',
                                style: TextStyle(color: AppColor.font1),
                              ),
                              TextSpan(
                                text: '의 홍보용 영상',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: YoutubePlayer(
                            controller: widget.youtubeController,
                            aspectRatio: 16 / 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            //7번
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '자주 묻는 질문',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          const Text(
                            '전체 펼치기',
                            style: TextStyle(
                                fontSize: 12,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ...List.generate(
                    faqData.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded[index] = !_isExpanded[index];
                          isSwitched = _isExpanded.every((element) => element);
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _isExpanded[index]
                                  ? const Color(0xFFF2F4F7)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Q. ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.font1),
                                        ),
                                        Text(
                                          faqData[index]["question"]!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AnimatedRotation(
                                      turns: _isExpanded[index] ? 0.5 : 0,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: const Icon(
                                        Icons.expand_more,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                if (_isExpanded[index]) ...[
                                  const SizedBox(height: 16),
                                  Text(
                                    faqData[index]["answer"]!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff4B4D51),
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          if (!_isExpanded[index])
                            const Divider(
                              color: Colors.grey,
                              thickness: 1, // 구분선 두께
                              height: 1, // 간격 없이 딱 맞도록
                            ),
                          if (_isExpanded[index])
                            const SizedBox(height: 16), // 열린 상태에서 컨테이너 간격
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 213,
                      height: 105,
                      child: SvgPicture.asset('assets/images/footer_logo.svg')),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '퀘스트스쿨은 진로 콘텐츠 전문 기업 사자가온다(주)에서',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const Text(
                    '개발한 교내 진로진학 상담 솔루션 서비스입니다.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () => _launchURL('https://sjgod.kr/'),
                          child: const Text(
                            '회사소개',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            _launchURL(
                                'https://minjae7189.notion.site/87708aafc4fa48e0aed3d95a397ab5f5');
                          },
                          child: const Text(
                            '듀토리얼 확인하기',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () =>
                              _launchURL('https://pf.kakao.com/_KAQxhb'),
                          child: const Text(
                            '문의하기',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ))
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'AM 10:00 - PM 17:00',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      Text(
                        '점심 PM 12:30 - PM 13:30',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Copyright ⓒ 2023 사자가온다㈜ All rights reserved.',
                        style: TextStyle(
                            color: AppColor.grey1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
