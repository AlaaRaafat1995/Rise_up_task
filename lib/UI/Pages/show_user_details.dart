import 'package:flutter/material.dart';
import 'package:rise_up_task/Models/user_model.dart';
import 'package:rise_up_task/UI/Pages/update_user_details.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/functions.dart';

class ShowUserDetails extends StatefulWidget {
  const ShowUserDetails({Key? key, required this.userDetails})
      : super(key: key);
  final UserModel userDetails;

  @override
  State<ShowUserDetails> createState() => _ShowUserDetailsState();
}

class _ShowUserDetailsState extends State<ShowUserDetails> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigation().navigatepush(context,
              UpdateUserPage(user: widget.userDetails, updateUi: updateUi));
        },
        child: const Icon(Icons.edit),
      ),
      appBar: AppBar(title: const Text("User Details")),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Name : ${widget.userDetails.name}",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "E-mail : ${widget.userDetails.email}",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Gender : ${widget.userDetails.gender}",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Status : ${widget.userDetails.status}",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
