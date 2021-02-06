import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/domain/entities/user.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: Navigator.of(context).pop,
        ),
      ),
      body: Center(
        child: Text(user.name),
      ),
    );
  }
}
