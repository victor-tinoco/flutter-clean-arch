import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/config/dependences_injector/dependences_injector.dart';
import 'package:squadmobile_base_project/app/config/router/routes.dart';
import 'package:squadmobile_base_project/app/config/constants/strings.dart';
import 'package:squadmobile_base_project/app/presentation/widgets/custom_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller;
  Map<FutureStatus, Widget Function()> _states;

  @override
  void initState() {
    super.initState();
    _controller = DependencesInjector.get<HomeController>();
    _controller.fetchUsers();
    _states = {
      FutureStatus.fulfilled: _buildSuccess,
      FutureStatus.rejected: _buildFailure,
      FutureStatus.pending: _buildLoading
    };

    reaction((_) => _controller.usersRequest.status, _onUserRequestChanges);
  }

  void _onUserRequestChanges(FutureStatus status) {
    switch (status) {
      case FutureStatus.fulfilled:
        _onUserRequestSuccess();
        break;
      case FutureStatus.rejected:
        _onUserRequestError();
        break;
      default:
    }
  }

  void _onUserRequestSuccess() {}

  void _onUserRequestError() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.USERS_LIST_TITLE),
      ),
      body: Observer(builder: (_) {
        final response = _controller.usersRequest;
        return _states[response.status]();
      }),
    );
  }

  Widget _buildEmptyState() => Center(child: Text("Vazio"));

  Widget _buildSuccess() {
    final data = _controller.usersRequest.value;

    if (data.isEmpty) return _buildEmptyState();
    return SingleChildScrollView(
      child: Column(
        children: List.generate(data.length, (index) {
          final item = data[index];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.userDetails,
                arguments: data[index],
              );
            },
            child: ListTile(
              title: Text(
                item.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildFailure() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.SEARCH_ERROR,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          CustomButton(
            text: Strings.TRY_AGAIN,
            onPressed: _controller.fetchUsers,
          )
        ],
      ),
    );
  }
}
