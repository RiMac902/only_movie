import 'package:fpdart/fpdart.dart';
import 'package:only_movie/core/error/failures.dart';

abstract class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call({Params params});
}

abstract class SyncUseCase<Type, Params> {
  Type call({Params params});
}
