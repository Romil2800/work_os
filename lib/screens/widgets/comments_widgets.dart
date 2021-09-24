import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  List<Color> _colors = [
    Colors.amber,
    Colors.orange,
    Colors.pink.shade200,
    Colors.brown,
    Colors.cyan,
    Colors.blue,
    Colors.deepOrange,
  ];
  @override
  Widget build(BuildContext context) {
    _colors.shuffle();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: _colors[0],
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/1077/1077114.png'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Commenter Name',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Comment body',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
