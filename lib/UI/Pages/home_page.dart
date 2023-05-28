import 'package:flutter/material.dart';
import 'package:rise_up_task/Models/user_model.dart';
import 'package:rise_up_task/Services/get_users.dart';
import 'package:rise_up_task/UI/Pages/add_new_user_page.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/functions.dart';
import 'package:rise_up_task/UI/Shared%20Widgets/users.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateui() {
    setState(() {});
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigation().navigatepush(
            context,
            AddNewUserPage(updateUi: updateui),
          );
        },
        mini: true,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "Get Users",
          style: TextStyle(fontSize: 30.0),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: GetUsersServices().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeleton(
              isLoading: isLoading,
              skeleton: SkeletonListView(),
              child: const Center(
                child: Text("There is no Users yet"),
              ),
            );
          }

          if (snapshot.hasData) {
            List<UserModel> users = snapshot.data!;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, i) => Users(
                user: users[i],
                updateui: updateui,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
