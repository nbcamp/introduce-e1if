import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/member.dart';
import 'package:introduce_e1if/screens/jinyong.dart';
import 'package:introduce_e1if/screens/kia.dart';
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
        create: (_) => CommentService(
          save: (payload) => pref.setString('comments', payload),
          load: () => Future.value(pref.getString('comments')),
        ),
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
      tmi: '운전면허 따는 중입니다',
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
      tmi: '고양이를 매우 좋아합니다',
      blog: 'velog.io/@tjdwns575859',
      github: 'github.com/dnjs012452',
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U05D7U63WDA-a33633dd164f-512',
    ),
    Member(
      name: '김상훈',
      mbti: 'ENFJ',
      role: '팀원',
      tmi: '정크푸드를 좋아합니다',
      blog: 'sanc93.github.io',
      github: 'github.com/sanc93',
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U05A2T9E5UP-2a1f31c8c5ff-512',
    ),
    Member(
      name: '장가겸',
      mbti: 'ISFP',
      role: '팀원',
      tmi: '귀여운 고양이 한 마리를 키웁니다',
      blog: 'velog.io/@rkrua0418',
      github: 'github.com/rkrua',
      profile:
          'https://ca.slack-edge.com/T043597JK8V-U059UCE8EEB-6804775942c0-512',
    ),
    Member(
      name: '김귀아',
      mbti: 'ISFJ',
      role: '팀원',
      tmi: '저는 집순이입니다.',
      blog: '',
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
                    '팀 소개입니다~~',
                    '팀 소개입니다~~',
                    '팀 소개입니다~~',
                    '팀 소개입니다~~',
                  ]),
                  const SizedBox(height: 20),
                  const Center(child: Header('팀원 소개')),
                  ...members.map(
                    (member) => MemberTile(member),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
