import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_os/constants/constants.dart';
import 'package:work_os/inner_screens/profile.dart';
import 'package:work_os/inner_screens/upload_task.dart';
import 'package:work_os/screens/all_workers.dart';
import 'package:work_os/screens/tasts_screen.dart';
import 'package:work_os/user_state.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.cyan),
            child: Column(
              children: [
                Flexible(
                  child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/1632/1632670.png'),
                ),
                SizedBox(height: 20),
                Flexible(
                  child: Text(
                    'Work Os English',
                    style: TextStyle(
                        color: Constants.darkBlue,
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _listTiles(
            'All Tasks',
            () {
              _navigateToAllTasksScreen(context);
            },
            Icons.task_outlined,
          ),
          _listTiles(
            'My Account',
            () {
              _navigateToProfileScreen(context);
            },
            Icons.settings_outlined,
          ),
          _listTiles(
            'Registered Workers',
            () {
              _navigateToAllWorkersScreen(context);
            },
            Icons.workspaces_outline,
          ),
          _listTiles(
            'Add Tasks',
            () {
              _navigateToAddTaskScreen(context);
            },
            Icons.add_task,
          ),
          Divider(
            thickness: 1,
          ),
          _listTiles(
            'Logout',
            () {
              _logout(context);
            },
            Icons.logout,
          ),
        ],
      ),
    );
  }

  void _navigateToAddTaskScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UploadTask()));
  }

  void _navigateToProfileScreen(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final String uid = user!.uid;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(
                  userId: uid,
                )));
  }

  void _navigateToAllTasksScreen(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TasksScreen()));
  }

  void _navigateToAllWorkersScreen(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AllWorkersScreen()));
  }

  void _logout(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/158/158730.png',
                height: 20,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'Sign out',
                ),
              )
            ],
          ),
          content: Text(
            'Do you want to sign out?',
            style: TextStyle(
              color: Constants.darkBlue,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                _auth.signOut();
                Navigator.canPop(context) ? Navigator.pop(context) : null;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserState();
                }));
              },
              child: Text('Yes'),
            )
          ],
        );
      },
    );
  }

  Widget _listTiles(String title, Function fct, IconData icon) {
    return ListTile(
      onTap: () {
        fct();
      },
      leading: Icon(
        icon,
        color: Constants.darkBlue,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Constants.darkBlue,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
