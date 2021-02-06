class Endpoints {
  static final user = _User();

  // Every endpoint at token black list wont be consumed
  // with bearer token - look at custom interceptor.
  static final Set<String> tokenBlackList = {
    user.list,
  };
}

class _User {
  final list = "/pokemon";

  // Example with some path param
  // final courseDropDown = "/users/${PathParams.USER_ID}";
}
