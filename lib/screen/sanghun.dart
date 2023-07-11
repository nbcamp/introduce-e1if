import 'package:flutter/material.dart';

class SanghunScreen extends StatefulWidget {
  const SanghunScreen({Key? key}) : super(key: key);

  @override
  _SanghunScreenState createState() => _SanghunScreenState();
}

class _SanghunScreenState extends State<SanghunScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {}, // TODO: main.dart로 돌아가기
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text("소개", style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(30.0),
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://1.bp.blogspot.com/-3woIFWz1_Zk/WvQH8sRKO_I/AAAAAAABL-4/tPcqQau8EQQTWxbOA2Y_ZCjii2HGZ85TQCLcBGAs/s400/torokko_trolley_rail_businessman.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "김상훈",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "서울 관악구\nsanc93@me.com",
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListView(
              shrinkWrap: true, // ListView가 필요한 공간만 차지하도록
              physics: const NeverScrollableScrollPhysics(), // 스크롤 막기
              children: const [
                Text(
                  ' 특기',
                ),
                SizedBox(height: 10),
                TileBox(
                  title: '수영',
                  tileColor: Color.fromARGB(255, 255, 116, 106),
                ),
                SizedBox(height: 30),
                Text(' 나의장점'),
                SizedBox(height: 10),
                TileBox(
                  title: '모든 일에 긍정적입니다',
                ),
                SizedBox(height: 10),
                TileBox(
                  title: '문제가 생겨도 포기하지 않습니다',
                ),
                SizedBox(height: 10),
                TileBox(
                  title: '새로운 것에 도전하는 것을 좋아합니다',
                ),
                SizedBox(height: 30),
                Divider(),
                Flexible(
                  child: TextField(
                    // onSubmitted: (value) {
                    // },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // TODO: 댓글 기능
                      labelText: '댓글',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TileBox extends StatelessWidget {
  final String title;
  final Color tileColor;

  const TileBox({
    super.key,
    required this.title,
    this.tileColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: const Icon(Icons.done),
      title: Text(title),
      tileColor: tileColor,
    );
  }
}
