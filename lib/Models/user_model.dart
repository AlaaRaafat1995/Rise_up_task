class UserModel {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });
  factory UserModel.fromjason(jasonData) {
    return UserModel(
        id: jasonData["id"],
        name: jasonData["name"],
        email: jasonData["email"],
        gender: jasonData["gender"],
        status: jasonData["status"]);
  }
}
