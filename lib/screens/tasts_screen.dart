import 'package:flutter/material.dart';
import 'package:work_os/constants/constants.dart';
import 'package:work_os/screens/widgets/drawer_widget.dart';
import 'package:work_os/screens/widgets/task_widget.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
          'Tasks',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showTaskCategotriesDialog(size);
            },
            icon: Icon(
              Icons.filter_list_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TaskWidget();
        },
      ),
    );
  }

  _showTaskCategotriesDialog(Size size) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Task Category',
            style: TextStyle(fontSize: 20, color: Colors.pink.shade800),
          ),
          content: Container(
            width: size.width * 0.9,
            child: ListView.builder(
                itemCount: Constants.taskCategoryList.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      print('okk ${Constants.taskCategoryList[index]}');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.red.shade200,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Constants.taskCategoryList[index],
                            style: TextStyle(
                                color: Constants.darkBlue,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel filter'),
            )
          ],
        );
      },
    );
  }
}
