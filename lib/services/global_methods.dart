import 'package:flutter/material.dart';
import 'package:work_os/constants/constants.dart';

class GlobalMethods{
  static void showErrorDialog({required String error,required BuildContext ctx}) {
    showDialog(
      context: ctx,
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
                  'Error Occured',
                ),
              )
            ],
          ),
          content: Text(
            error,
            style: TextStyle(
              color: Constants.darkBlue,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}