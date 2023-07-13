import 'package:flutter/material.dart';

import 'package:introduce_e1if/screens/seongjun.dart';
import 'package:introduce_e1if/models/member.dart';
import 'package:introduce_e1if/screens/jinyong.dart';
import 'package:introduce_e1if/services/data_handler.dart';
import 'package:introduce_e1if/screens/kia.dart';
import 'package:introduce_e1if/screens/sanghun.dart';
import 'package:introduce_e1if/screens/gagyeom.dart';
import 'package:introduce_e1if/services/comment.dart';
import 'package:introduce_e1if/widgets/header.dart';
import 'package:introduce_e1if/widgets/member_tile.dart';
import 'package:introduce_e1if/widgets/paragraph.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CommentService(IO(
          save: (payload) => pref.setString('comments', payload),
          load: () => pref.getString('comments'),
        )),
      ),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<Member> members = [
    Member(
      name: '박진용',
      mbti: 'ISTP',
      role: '팀장',
      tmi: '다양한 언어로 코딩하는 걸 즐겨요! '
          '요새는 Swift, TypeScript, Python, Shell Script 등 '
          '여러 언어를 활용해서 프로젝트를 진행하고 있어요. 할 게 너무 많아요!',
      blog: 'jinyongp.dev',
      widget: const JinyongScreen(),
      github: 'github.com/jinyongp',
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U05DNT33RMG-149b84f4be03-512',
    ),
    Member(
      name: '원성준',
      mbti: 'ISFJ',
      role: '팀원',
      tmi: '고양이를 매우 좋아합니다. 언젠가 간택 당하길 원하고 있습니다 ㅎㅎ '
          '취미로는 건강을 챙기기 위해 주 6일 운동하고 있고 '
          '3대 500을 목표를 두고  운동 중 입니다. E1IF 짱!',
      blog: 'velog.io/@tjdwns575859',
      widget: SeongjunScreen(),
      github: 'github.com/dnjs012452',
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U05D7U63WDA-a33633dd164f-512',
    ),
    Member(
      name: '김상훈',
      mbti: 'ENFJ',
      role: '팀원',
      tmi: '저는 정크푸드를 진~짜 좋아합니다. '
          '작년에는 주로 피자를 많이 먹었는데 '
          '요즘은 주말마다 수제버거집 도장깨기를 하고 있습니다.',
      blog: 'sanc93.github.io',
      github: 'github.com/sanc93',
      widget: const SanghunScreen(),
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U05A2T9E5UP-2a1f31c8c5ff-512',
    ),
    Member(
      name: '장가겸',
      mbti: 'ISFP',
      role: '팀원',
      tmi: '귀여운 고양이 한 마리를 키웁니다! '
          '저희 집에 온지 벌써 430일을 넘어가는 청소년(?)냥이랍니다 ㅎㅎ '
          '축구 하는 거나 보는 거 전부 좋아하고 가장 좋아하는 팀은 첼시에요!',
      blog: 'velog.io/@rkrua0418',
      widget: const GagyeomScreen(),
      github: 'github.com/rkrua',
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U059UCE8EEB-6804775942c0-512',
    ),
    Member(
      name: '김귀아',
      mbti: 'ISFJ',
      role: '팀원',
      tmi: '저는 저희집 강아지를 많이 좋아합니다. '
          '하지만 저희 강아지는 엄마다음에 아빠다음에 오빠다음으로 '
          '저를 좋아하는것같애요 무려 4순위네요.. 눈물좀 닦고 올게요..',
      blog: 'velog.io/@hnmpot',
      widget: const KiaPage(),
      github: 'github.com/kiakim01',
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U05D6G5MADS-4ec3ce18cdf8-512',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Header('팀 소개')),
                  const Paragraph([
                    '안녕하세요! 우리는 E1IF 팀입니다.',
                  ]),
                  const Paragraph([
                    '우리는 협력과 소통을 중시합니다. 문제를 해결하기 위해 자유롭게 아이디어를 나누고 '
                        '어려운 문제에 직면하면 혼자 고민하기보다 팀원과 공유하며 함께 성장해 나갑니다.'
                  ]),
                  const Center(child: Header('팀 목표')),
                  const Paragraph(['우리의 목표는 협력과 소통을 기반한 팀원 모두의 성장입니다.']),
                  const Paragraph([
                    '이번 과제를 수행하며 사전캠프의 취지에 맞게 앱 개발 전반의 지식을 몸소 경험하며, '
                        '효율적인 협업을 위해 Git 활용법에 익숙해질 것 입니다.'
                  ]),
                  const Paragraph([
                    '우리는 기능 구현에 치중하는 대신 문제를 해결하는 방식을 개선하기 위해 노력할 것 입니다. '
                        '소통을 통해 더 나은 코드를 작성하고 더 나은 해결 방법을 찾을 것입니다.'
                  ]),
                  const Center(child: Header('팀원 소개')),
                  ...members.map(
                    (member) => MemberTile(member),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
