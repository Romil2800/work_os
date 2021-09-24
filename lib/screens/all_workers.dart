import 'package:flutter/material.dart';
import 'package:work_os/constants/constants.dart';
import 'package:work_os/screens/widgets/all_workers_widgets.dart';
import 'package:work_os/screens/widgets/drawer_widget.dart';
import 'package:work_os/screens/widgets/task_widget.dart';

class AllWorkersScreen extends StatefulWidget {
  @override
  _AllWorkersScreenState createState() => _AllWorkersScreenState();
}

class _AllWorkersScreenState extends State<AllWorkersScreen> {
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
          'All Workers',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return AllWorkersWidget();
        },
      ),
    );
  }
}
