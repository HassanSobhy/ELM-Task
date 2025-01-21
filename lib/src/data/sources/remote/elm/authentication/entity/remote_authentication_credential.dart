import 'package:elm_task/src/domain/entity/authentication/authentication_credential.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_authentication_credential.g.dart';

@JsonSerializable()
class RemoteAuthenticationCredential {
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'roles')
  final List<int>? roles;

  const RemoteAuthenticationCredential({
    this.token = "",
    this.roles = const [],
  });

  factory RemoteAuthenticationCredential.fromJson(Map<String, dynamic> json) =>
      _$RemoteAuthenticationCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAuthenticationCredentialToJson(this);
}

extension RemoteAuthenticationCredentialExtension on RemoteAuthenticationCredential {
  AuthenticationCredential mapToDomain() {
    return AuthenticationCredential(
      token: token ?? "",
      roles: roles ?? [],
    );
  }
}
