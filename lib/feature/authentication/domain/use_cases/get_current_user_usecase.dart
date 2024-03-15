
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';


class GetCurrentUserUseCase implements SyncUseCase<User?, void> {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  @override
  User? call({void params}) {
    return _authRepository.getCurrentUser();
  }
}