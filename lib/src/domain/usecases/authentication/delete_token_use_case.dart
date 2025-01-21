import 'package:elm_task/src/domain/repositories/authentication_repository.dart';

class DeleteTokenUseCase {
  final AuthenticationRepository _repository;

  DeleteTokenUseCase(this._repository);

  Future<void> call() async {
    return await _repository.deleteToken();
  }
}
