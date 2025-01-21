import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/repositories/authentication_repository.dart';

class SaveTokenUseCase {
  final AuthenticationRepository _repository;

  SaveTokenUseCase(this._repository);

  Future<void> call(String token) async{
    return await _repository.saveToken(token);
  }
}