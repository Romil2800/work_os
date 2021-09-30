import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_os/constants/constants.dart';
import 'package:work_os/inner_screens/profile.dart';

class AllWorkersWidget extends StatefulWidget {
  final String userId;
  final String userName;
  final String userEmail;
  final String positionInCompany;
  final String phoneNumber;
  final String userImageUrl;

  const AllWorkersWidget(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.positionInCompany,
      required this.phoneNumber,
      required this.userImageUrl});

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
          onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          userId: widget.userId,
                        )));
          },
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
              child: Image.network(widget.userImageUrl == null
                  ? 'https://cdn-icons-png.flaticon.com/512/1077/1077063.png'
                  : widget.userImageUrl),
            ),
          ),
          title: Text(
            widget.userName,
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
                widget.positionInCompany + '/' + widget.phoneNumber,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              _mailTo();
            },
            icon: Icon(
              Icons.mail_outline,
              size: 30,
              color: Colors.pink.shade800,
            ),
          )),
    );
  }

  void _mailTo() async {
    var mailUrl = 'mailto:${widget.userEmail}';

    await launch(mailUrl);
  }
}
