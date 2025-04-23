
import '../../utils/parsing_helper.dart';

class UserResponseModel {
  UserModel? userModel;

  UserResponseModel({this.userModel});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    userModel = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userModel != null) {
      data['user'] = userModel!.toJson();
    }
    return data;
  }
}

class UserModel {
  int coins = 0;
  int energy = 0;
  List<Level> level = const [];
  String sId = "";
  String name = "";
  String email = "";
  String password = "";
  int iV = 0;

  UserModel(
      {this.coins = 0,
      this.energy = 0,
      this.level = const [],
      this.sId = "",
      this.name = "",
      this.email = "",
      this.password = "",
      this.iV = 0});

  UserModel.fromJson(Map<String, dynamic> json) {
    coins = ParsingHelper.parseIntMethod(json['coins']);
    energy = ParsingHelper.parseIntMethod(json['energy']) >= 5 ? 5 : ParsingHelper.parseIntMethod(json['energy']);
    sId = ParsingHelper.parseStringMethod(json['_id']);
    name = ParsingHelper.parseStringMethod(json['name']);
    email = ParsingHelper.parseStringMethod(json['email']);
    password = ParsingHelper.parseStringMethod(json['password']);
    iV = ParsingHelper.parseIntMethod(json['__v']);
    if (json['level'] != null) {
      List<Map<String,dynamic>> levelList = ParsingHelper.parseMapsListMethod(json["level"]);
      level = levelList.map((e) =>  Level.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coins'] = coins;
    data['energy'] = energy;
    data['level'] = level;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['__v'] = iV;
    data['level'] = level.map((v) => v.toJson()).toList();
      return data;
  }
}

class Level {
  String sId = "";
  int level = 0;
  int stars = 0;

  Level({
    this.sId = '',
    this.level = 0,
    this.stars = 0,
  });

  Level.fromJson(Map<String, dynamic> json) {
    sId = ParsingHelper.parseStringMethod(json['_id']);
    level = ParsingHelper.parseIntMethod(json['level']);
    stars = ParsingHelper.parseIntMethod(json['stars']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['level'] = level;
    data['stars'] = stars;
    return data;
  }
}