import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/repositories/authentication_repository.dart';

class LoginUseCase {
  final AuthenticationRepository _repository;

  LoginUseCase(this._repository);

  Future<DataState> call(String email) async{
    return await _repository.login(email);
  }
}