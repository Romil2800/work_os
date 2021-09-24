import 'package:flutter/material.dart';
import 'package:work_os/constants/constants.dart';

class AllWorkersWidget extends StatefulWidget {
  const AllWorkersWidget({Key? key}) : super(key: key);

  @override
  _AllWorkersWidgetState createState() => _AllWorkersWidgetState();
}

class _AllWorkersWidgetState extends State<AllWorkersWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Container(
            padding: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1),
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/1077/1077063.png'),
            ),
          ),
          title: Text(
            'Worker Name',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Constants.darkBlue,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.linear_scale_outlined,
                color: Colors.pink.shade800,
              ),
              Text(
                'Position/6589856699',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mail_outline,
              size: 30,
              color: Colors.pink.shade800,
            ),
          )),
    );
  }
}
