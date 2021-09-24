import 'package:flutter/material.dart';
import 'package:work_os/constants/constants.dart';
import 'package:work_os/screens/widgets/comments_widgets.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  var _titleStyle = TextStyle(
    color: Constants.darkBlue,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  bool _isCommenting = true;

  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Back',
            style: TextStyle(
              color: Constants.darkBlue,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Task title',
              style: TextStyle(
                color: Constants.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Uploaded by ', style: _titleStyle),
                          Spacer(),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.pink.shade700,
                              ),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/1077/1077114.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Uploader Name',
                                style: TextStyle(
                                  color: Constants.darkBlue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Uploader Job',
                                style: TextStyle(
                                  color: Constants.darkBlue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      dividerWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Uploaded on:', style: _titleStyle),
                          Text(
                            'Date: 02-08-2000',
                            style: TextStyle(
                              color: Constants.darkBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Deadline Date:', style: _titleStyle),
                          Text(
                            'Date: 02-08-2000',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'still have time',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      dividerWidget(),
                      Text('Done State:', style: _titleStyle),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Done',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Constants.darkBlue,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0,
                            child: Icon(
                              Icons.check_box,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Not Done',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Constants.darkBlue,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 1,
                            child: Icon(
                              Icons.check_box,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      dividerWidget(),
                      Text(
                        'Task Description: ',
                        style: _titleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Uploader Job: ',
                        style: TextStyle(
                          color: Constants.darkBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AnimatedSwitcher(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        child: _isCommenting
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _commentController,
                                      style:
                                          TextStyle(color: Constants.darkBlue),
                                      maxLength: 200,
                                      keyboardType: TextInputType.text,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.pink),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          color: Colors.pink.shade700,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            'Post',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _isCommenting = !_isCommenting;
                                          });
                                        },
                                        child: Text('Cancel'),
                                      ),
                                    ],
                                  ))
                                ],
                              )
                            : Center(
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _isCommenting = !_isCommenting;
                                    });
                                  },
                                  color: Colors.pink.shade700,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Add a comment',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CommentWidget();
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                          );
                        },
                        itemCount: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dividerWidget() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
