import 'package:rise_up_task/Helper/api.dart';
import 'package:rise_up_task/Models/user_model.dart';

class UpdateUserServices {
  Future<UserModel> updateUser(
      {required int id,
      required String name,
      required String email,
      required String gender,
      required String status,
      required context}) async {
    Map<String, dynamic> data = await Api().put(
        url: "https://gorest.co.in/public/v2/users/$id",
        body: {
          "name": name,
          "email": email,
          "gender": gender,
          "status": status,
        },
        context: context);
    return UserModel.fromjason(data);
  }
}
