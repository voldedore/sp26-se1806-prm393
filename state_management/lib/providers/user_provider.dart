import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/user.dart';

List<User> allUsers = [
  User(id: 1, name: 'John', email: 'jon@mail.com'),
  User(id: 2, name: 'NVA', email: 'jon@mail.com'),
  User(id: 3, name: 'TBT', email: 'jon@mail.com'),
  User(id: 4, name: 'NBC', email: 'jon@mail.com'),
  User(id: 5, name: 'John2', email: 'jon@mail.com'),
  User(id: 6, name: 'John3', email: 'jon@mail.com'),
];

// Provider (cung cấp) các dự liệu user
final userProvider = Provider((ref){
  return allUsers;
});