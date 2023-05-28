import 'package:rise_up_task/Helper/api.dart';
import 'package:rise_up_task/Models/user_model.dart';

String token =
    "89b41ca9006679c53a2e1c0f72dd63359c2aa1eed243e45ce0100051061cbc86";

class AddUserServices {
  Future<UserModel> addUser(
      {required String name,
      required String email,
      required String gender,
      required String status,
      required context}) async {
    Map<String, dynamic> data = await Api().post(
      url: "https://gorest.co.in/public/v2/users?token=$token",
      body: {
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      },
      context: context,
    );

    return UserModel.fromjason(data);
  }
}
