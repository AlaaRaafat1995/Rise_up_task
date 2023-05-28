import 'package:flutter/material.dart';
import 'package:rise_up_task/Services/add_user.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/custom_text_filed.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/functions.dart';

class AddNewUserPage extends StatefulWidget {
  const AddNewUserPage({Key? key, required this.updateUi}) : super(key: key);
  final VoidCallback updateUi;

  @override
  State<AddNewUserPage> createState() => _AddNewUserPageState();
}

class _AddNewUserPageState extends State<AddNewUserPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    String? name, email, gender, status;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTextField(
              labelText: "name",
              hintText: "Enter Your Name",
              valid: (name) {
                if (!(name!.startsWith(RegExp(r'[A-Z]')))) {
                  return "Start With Capital Letter";
                }
                return null;
              },
              onChanged: (data) {
                name = data;
              },
            ),
            CustomTextField(
              labelText: "email",
              hintText: "Enter Your E-mail",
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
                  return null;
                }
              },
              onChanged: (data) {
                email = data;
              },
            ),
            CustomTextField(
              labelText: "gender",
              hintText: "Enter Your Gender",
              valid: (val) {
                if (val == "female" || val == "male") {
                  return null;
                }
                return ("Female or Male Only");
              },
              onChanged: (data) {
                gender = data;
              },
            ),
            CustomTextField(
              labelText: "status",
              hintText: "Enter Your Status",
              valid: (status) {
                if (status == "active" || status == "inactive") {
                  return null;
                }
                return ("Active or Inactive Only");
              },
              onChanged: (data) {
                status = data;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  var formvalid = formkey.currentState;

                  if (formvalid!.validate()) {
                    var user = await AddUserServices().addUser(
                        context: context,
                        name: name!,
                        email: email!,
                        gender: gender!,
                        status: status!);
                    if (user != null) {
                      const CircularProgressIndicator();
                      widget.updateUi();

                      Navigation().navigatepop(context);
                    }
                  }
                },
                child: const Text("Save User"))
          ]),
        ),
      ),
    );
  }
}
