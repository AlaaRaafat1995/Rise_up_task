import 'package:flutter/material.dart';
import 'package:rise_up_task/Services/delete_user.dart';

class Navigation {
  navigatepush(BuildContext context, Widget route) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
  }

  navigateReplace(BuildContext context, Widget route) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => route));
  }

  navigatepop(BuildContext context) {
    Navigator.of(context).pop();
  }
}

snake(context, String title) {
  final snackBar = SnackBar(
      content: Text(title),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: "close",
        textColor: Colors.white,
        onPressed: () {},
      ));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future<void> showAlertDialog(
    {required BuildContext context,
    required int id,
    required VoidCallback updateui}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete User"),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text("Are you sure want to delete this user ?"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () async {
              await DeleteUserServices().deleteUser(id: id);
              updateui();

              Navigation().navigatepop(context);
            },
          ),
        ],
      );
    },
  );
}
