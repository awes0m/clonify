import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:fpdart/fpdart.dart' show Right, Left;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user_model.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository ;
  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    return null;
  }

  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final res = await _authRemoteRepository.signUp(
        name: name, email: email, password: password);
    final val = switch (res) {
      Left(value: final l) => state = AsyncError(l, StackTrace.current),
      Right(value: final r) => state = AsyncData(r),
    };
    print(val);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final res =
        await _authRemoteRepository.login(email: email, password: password);
    final val = switch (res) {
      Left(value: final l) => state = AsyncError(l, StackTrace.current),
      Right(value: final r) => state = AsyncData(r),
    };
    print(val);
  }
}
