import 'package:rise_up_task/Helper/api.dart';
import 'package:rise_up_task/Models/user_model.dart';

class GetUsersServices {
  Future<List<UserModel>> getUsers() async {
    List<dynamic> data =
        await Api().get(url: "https://gorest.co.in/public/v2/users");

    List<UserModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        UserModel.fromjason(data[i]),
      );
    }

    return productsList;
  }
}
