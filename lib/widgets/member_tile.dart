import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/member.dart';
import 'package:introduce_e1if/widgets/link.dart';

class MemberTile extends StatelessWidget {
  const MemberTile(this.member, {super.key});

  final Member member;

  @override
  Widget build(BuildContext context) {
    var Member(
      :name,
      :mbti,
      :tmi,
      :role,
      :blog,
      :github,
      :profile,
      :widget,
    ) = member;

    return GestureDetector(
      onTap: () {
        if (widget != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => widget,
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(profile),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        mbti,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Link('https://$blog',
                          alt: 'BLOG', style: const TextStyle(fontSize: 10)),
                      const SizedBox(
                        height: 10,
                        child: VerticalDivider(
                          width: 10,
                          color: Colors.black26,
                          thickness: 1,
                        ),
                      ),
                      Link(
                        'https://$github',
                        alt: 'GITHUB',
                        style: const TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text('$tmi ' * 5, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
