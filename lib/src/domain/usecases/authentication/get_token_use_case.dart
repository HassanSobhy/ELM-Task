import 'package:elm_task/src/domain/repositories/authentication_repository.dart';

class GetTokenUseCase {
  final AuthenticationRepository _repository;

  GetTokenUseCase(this._repository);

  Future<String> call() async {
    return await _repository.getToken();
  }
}
