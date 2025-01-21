import 'package:equatable/equatable.dart';

class AuthenticationCredential extends Equatable {
  final String token;
  final List<int> roles;

  const AuthenticationCredential({
    this.token = "",
    this.roles = const [],
  });

  @override
  List<Object> get props => [
        token,
        roles,
      ];
}
