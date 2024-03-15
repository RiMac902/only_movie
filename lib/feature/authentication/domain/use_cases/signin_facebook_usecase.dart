
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class SignInWithFacebookUseCase implements UseCase<void, void> {
  final AuthRepository _authRepository;

  SignInWithFacebookUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> call({void params}) {
    return _authRepository.signInWithFacebook();
  }
}