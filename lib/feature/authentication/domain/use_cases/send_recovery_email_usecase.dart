
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class SendRecoveryEmailUseCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  SendRecoveryEmailUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> call({String? params}) {
    return _authRepository.sendRecoveryEmail(params!);
  }
}