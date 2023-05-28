import 'package:flutter/material.dart';
import 'package:rise_up_task/Models/user_model.dart';
import 'package:rise_up_task/Services/update_user.dart';
import 'package:rise_up_task/UI/Pages/home_page.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/custom_text_filed.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/functions.dart';

class UpdateUserPage extends StatefulWidget {
  UpdateUserPage({Key? key, required this.user, required this.updateUi})
      : super(key: key);
  final UserModel user;
  VoidCallback updateUi;

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  String? name, email, gender, status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update User"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextField(
            valid: (name) {
              if (!(name!.startsWith(RegExp(r'[A-Z]')))) {
                return "Start With Capital Letter";
              }
              return "";
            },
            labelText: "name",
            hintText: "Enter Your Name",
            onChanged: (data) {
              name = data;
            },
          ),
          CustomTextField(
            valid: (value) {
              String p =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

              RegExp regExp = RegExp(p);
              if (value!.isEmpty) {
                return ('Please, Enter Email');
              } else if (!regExp.hasMatch(value)) {
                return ('Please, Enter Valid Email');
              }
              if (!(value.endsWith(".com"))) {
                return ('Please, Enter Valid Email');
              } else {
                return "";
              }
            },
            labelText: "email",
            hintText: "Enter Your E-mail",
            onChanged: (data) {
              email = data;
            },
          ),
          CustomTextField(
            valid: (val) {
              return "";
            },
            labelText: "gender",
            hintText: "Enter Your Gender",
            onChanged: (data) {
              gender = data;
            },
          ),
          CustomTextField(
            valid: (val) {
              return "";
            },
            labelText: "status",
            hintText: "Enter Your Status",
            onChanged: (data) {
              status = data;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await UpdateUserServices().updateUser(
                context: context,
                id: widget.user.id,
                name: name == null ? widget.user.name : name!,
                email: email == null ? widget.user.email : email!,
                gender: gender == null ? widget.user.gender : gender!,
                status: status == null ? widget.user.status : status!,
              );
              const CircularProgressIndicator();
              widget.updateUi();
              Navigation().navigateReplace(context, HomePage());
            },
            child: const Text("Update User"),
          )
        ]),
      ),
    );
  }
}
