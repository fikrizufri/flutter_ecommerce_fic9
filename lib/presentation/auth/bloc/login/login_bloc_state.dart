part of 'login_bloc_bloc.dart';

@freezed
class LoginBlocState with _$LoginBlocState {
  const factory LoginBlocState.initial() = _Initial;
  const factory LoginBlocState.loading() = _Loading;
  const factory LoginBlocState.erorr(String message) = _Erorr;
  const factory LoginBlocState.success(AuthResponseModel data) = _Success;
}
