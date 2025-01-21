import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable()
class VerifyOTPRequest {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'otp')
  final String otp;

  const VerifyOTPRequest({
    required this.email,
    required this.otp,
  });

  factory VerifyOTPRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOTPRequestToJson(this);

  @override
  String toString() {
    return 'VerifyOTPRequest{email: $email , otp: $otp}';
  }
}
