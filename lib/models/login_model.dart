class UserModel {
  int id;
  String email;
  String phone;
  String image;
  int point;
  int credit;
  String token;

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.image,
    required this.point,
    required this.credit,
    required this.token});

  factory UserModel.fromJson(Map<String, dynamic>json){
    return UserModel(
        id: json['id'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        point: json['points']?? 0,
        credit: json['credit']?? 0,
        token: json['token']);
  }
}
