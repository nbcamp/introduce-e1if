import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.main,
    required this.main2,
  });

  final String imageUrl;
  final String title;
  final String main;
  final String main2;

  @override
  State<Feed> createState() => _feedState();
}

class _feedState extends State<Feed> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(42),
            // 이미지
            child: Image.network(
              widget.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6),
                Text(
                  widget.main,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  widget.main2,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 0),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // 화면 갱신
                        setState(() {
                          isFavorite = !isFavorite; // 좋아요 토글
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            isFavorite
                                ? CupertinoIcons.hand_thumbsup
                                : CupertinoIcons.hand_thumbsup_fill,
                            color: isFavorite ? Colors.black45 : Colors.black,
                            size: 16,
                          ),
                          /*Text(
                            '1',
                            style: TextStyle(color: Colors.black54),
                          ),*/
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
