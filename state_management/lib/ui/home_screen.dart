import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/user_provider.dart';

// Đổi lớp Cha StatelessWidget -> ConsumerWidget
class HomeStlss extends ConsumerWidget {
  const HomeStlss({super.key});

  @override // trong p/thức build: thêm 1 param là WidgetRef ref
  Widget build(BuildContext context, WidgetRef ref) {
    // Dùng ref để gọi userProvider (lấy state)
    final users = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children:
          users.map((u) {
            return ListTile(
              trailing: Icon(Icons.edit),
              title: Text(u.name),
              subtitle: Text(u.email),
            );
          }).toList()
        ,
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            trailing: Icon(Icons.edit),
            title: Text('user 1'),
            subtitle: Text('user@gmail.com'),
          ),
          ListTile(
            trailing: Icon(Icons.edit),
            title: Text('user 1'),
            subtitle: Text('user@gmail.com'),
          ),
          ListTile(
            trailing: Icon(Icons.edit),
            title: Text('user 1'),
            subtitle: Text('user@gmail.com'),
          ),
        ],
      ),
    );
  }
}
