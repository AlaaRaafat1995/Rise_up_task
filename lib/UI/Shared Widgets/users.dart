import 'package:flutter/material.dart';
import 'package:rise_up_task/Models/user_model.dart';
import 'package:rise_up_task/UI/Pages/show_user_details.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/functions.dart';

class Users extends StatefulWidget {
  Users({Key? key, required this.user, required this.updateui})
      : super(key: key);
  final UserModel user;
  VoidCallback updateui;

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () async {
        showAlertDialog(
            context: context, id: widget.user.id, updateui: widget.updateui);
      },
      onTap: () {
        Navigation().navigatepush(
          context,
          ShowUserDetails(
            userDetails: widget.user,
          ),
        );
      },
      trailing: widget.user.status == "active"
          ? const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 7,
            )
          : const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 7,
            ),
      title: Text(
        widget.user.name,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
