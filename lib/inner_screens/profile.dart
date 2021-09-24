import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_os/constants/constants.dart';
import 'package:work_os/screens/widgets/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _titleTextStyle = TextStyle(
    fontSize: 22,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  var _contentTextStyle = TextStyle(
    color: Constants.darkBlue,
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Card(
              margin: EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text('Name', style: _titleTextStyle)),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Job Since joined date 2021-01-22',
                        style: TextStyle(
                          color: Constants.darkBlue,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text('Contact Info', style: _titleTextStyle),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child:
                          userInfo(title: 'Email:', content: 'Email@gmail.com'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: userInfo(title: 'Phone:', content: '28898945565'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _contectBy(
                            color: Colors.green,
                            fct: () {
                              _openWhatsAppChat();
                            },
                            icon: Icons.message_outlined),
                        _contectBy(
                            color: Colors.purple,
                            fct: () {
                              _mailTo();
                            },
                            icon: Icons.email_outlined),
                        _contectBy(
                          color: Colors.red,
                          fct: () {
                            _callPhoneNumber();
                          },
                          icon: Icons.call_outlined,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.pink.shade700,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: size.width * 0.26,
                    height: size.width * 0.26,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 8,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/1077/1077114.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _openWhatsAppChat() async {
    int phoneNumber = 5664585;
    var url = 'https://wa.me/$phoneNumber?text=HelloWorld';

    await launch(url);
  }

  void _mailTo() async {
    String email = 'romil@gmail.com';
    var mailUrl = 'mailto:$email';

    await launch(mailUrl);
  }

  void _callPhoneNumber() async {
    int phoneNumber = 5664585;
    var url = 'tel://$phoneNumber';
    await launch(url);
  }

  Widget _contectBy(
      {required Color color, required Function fct, required IconData icon}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 25,
      child: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(icon, color: color),
            onPressed: () {
              fct();
            },
          )),
    );
  }

  Widget userInfo({required String title, required String content}) {
    return Row(
      children: [
        Text(title, style: _titleTextStyle),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(content, style: _contentTextStyle),
        ),
      ],
    );
  }
}
