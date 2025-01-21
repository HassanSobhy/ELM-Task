// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_authentication_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAuthenticationCredential _$RemoteAuthenticationCredentialFromJson(
        Map<String, dynamic> json) =>
    RemoteAuthenticationCredential(
      token: json['token'] as String? ?? "",
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteAuthenticationCredentialToJson(
        RemoteAuthenticationCredential instance) =>
    <String, dynamic>{
      'token': instance.token,
      'roles': instance.roles,
    };
