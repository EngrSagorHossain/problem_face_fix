import 'dart:convert';

/// user : {"id":5,"owner_name":"Sagor Hossain","shop_name":"Sheikh IT","address":"Dhaka Bangladesh","phone":"01941194921","email":"s1111@gmail.com","profile_image":"profile_images/hpfyn4QEVZCk6zrbKFtWvz1gGjR4yIzPSK3eAVTp.png","user_type":"admin","is_locked":1,"user_coins":0}
/// token : "5|CezvUChlQs8pUvyq6szh0II2SWs0Vcix92dUiwMda59cb54b"

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));
String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    User? user,
    String? token,
  }) {
    _user = user;
    _token = token;
  }

  UserProfile.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User? _user;
  String? _token;
  UserProfile copyWith({
    User? user,
    String? token,
  }) =>
      UserProfile(
        user: user ?? _user,
        token: token ?? _token,
      );
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

/// id : 5
/// owner_name : "Sagor Hossain"
/// shop_name : "Sheikh IT"
/// address : "Dhaka Bangladesh"
/// phone : "01941194921"
/// email : "s1111@gmail.com"
/// profile_image : "profile_images/hpfyn4QEVZCk6zrbKFtWvz1gGjR4yIzPSK3eAVTp.png"
/// user_type : "admin"
/// is_locked : 1
/// user_coins : 0

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    num? id,
    String? ownerName,
    String? shopName,
    String? address,
    String? phone,
    String? email,
    String? profileImage,
    String? userType,
    num? isLocked,
    num? userCoins,
  }) {
    _id = id;
    _ownerName = ownerName;
    _shopName = shopName;
    _address = address;
    _phone = phone;
    _email = email;
    _profileImage = profileImage;
    _userType = userType;
    _isLocked = isLocked;
    _userCoins = userCoins;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _ownerName = json['owner_name'];
    _shopName = json['shop_name'];
    _address = json['address'];
    _phone = json['phone'];
    _email = json['email'];
    _profileImage = json['profile_image'];
    _userType = json['user_type'];
    _isLocked = json['is_locked'];
    _userCoins = json['user_coins'];
  }
  num? _id;
  String? _ownerName;
  String? _shopName;
  String? _address;
  String? _phone;
  String? _email;
  String? _profileImage;
  String? _userType;
  num? _isLocked;
  num? _userCoins;
  User copyWith({
    num? id,
    String? ownerName,
    String? shopName,
    String? address,
    String? phone,
    String? email,
    String? profileImage,
    String? userType,
    num? isLocked,
    num? userCoins,
  }) =>
      User(
        id: id ?? _id,
        ownerName: ownerName ?? _ownerName,
        shopName: shopName ?? _shopName,
        address: address ?? _address,
        phone: phone ?? _phone,
        email: email ?? _email,
        profileImage: profileImage ?? _profileImage,
        userType: userType ?? _userType,
        isLocked: isLocked ?? _isLocked,
        userCoins: userCoins ?? _userCoins,
      );
  num? get id => _id;
  String? get ownerName => _ownerName;
  String? get shopName => _shopName;
  String? get address => _address;
  String? get phone => _phone;
  String? get email => _email;
  String? get profileImage => _profileImage;
  String? get userType => _userType;
  num? get isLocked => _isLocked;
  num? get userCoins => _userCoins;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner_name'] = _ownerName;
    map['shop_name'] = _shopName;
    map['address'] = _address;
    map['phone'] = _phone;
    map['email'] = _email;
    map['profile_image'] = _profileImage;
    map['user_type'] = _userType;
    map['is_locked'] = _isLocked;
    map['user_coins'] = _userCoins;
    return map;
  }
}
