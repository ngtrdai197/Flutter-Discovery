import 'package:myapp/models/api_constants.dart';
import 'package:myapp/services/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;

  User(this.id, this.name, this.imageUrl);
}

class UserNode {
  final String username;
  final String password;
  final String role;
  final String fullName;
  final String id;

  UserNode({this.username, this.password, this.role, this.fullName, this.id});

  factory UserNode.fromJson(Map<String, dynamic> json) {
    return UserNode(
      username: json['username'],
      id: json['id'],
      password: json['password'],
      fullName: json['fullName'],
      role: json['role'],
    );
  }
}

Future<List<UserNode>> fetchUsers() async {
  final network = await getApiClient();
  final response = await network.get('${ApiConstants.user}');
  print(response.statusCode);
  if (response.statusCode == 200) {
    final List users = response.data;
    final List<UserNode> listOfUsers =
        users.map((value) => UserNode.fromJson(value)).toList();
    return listOfUsers;
  } else {
    throw Exception('Failed to load user');
  }
}

Future<bool> authLogin(String username, String password) async {
  final Map<String, String> userInput = {
    "username": username,
    "password": password
  };
  final network = await getApiClient();
  final response = await network.post('${ApiConstants.auth}', data: userInput);

  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', response.data['token']);
    return true;
  } else {
    throw Exception('Failed to load user');
  }
}
