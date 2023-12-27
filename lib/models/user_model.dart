class UserModel {
  final String? name;
  final String? imageUrl;
  final String? date;
  final String? userEmail;
  final String? userPhone;
  final String? userName;

  UserModel(
      {this.date,
      this.userEmail,
      this.userPhone,
      this.userName,
      this.name,
      this.imageUrl});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
      };
}
