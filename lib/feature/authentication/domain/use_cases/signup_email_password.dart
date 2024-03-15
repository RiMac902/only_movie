
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase implements UseCase<void, Map<String, dynamic>> {
  final AuthRepository _authRepository;

  SignUpWithEmailAndPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> call({Map<String, dynamic>? params}) {
    return _authRepository.createUserWithEmailAndPassword(params!['email'], params['password']);
  }
}