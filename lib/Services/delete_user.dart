import 'package:rise_up_task/Helper/api.dart';

class DeleteUserServices {
  Future<void> deleteUser({
    required int id,
  }) async {
    await Api().delete(
      url: "https://gorest.co.in/public/v2/users/$id",
    );
  }
}
