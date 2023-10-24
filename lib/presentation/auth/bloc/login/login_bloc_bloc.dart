import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_fic9/data/models/requests/login_request_model.dart';
import 'package:flutter_ecommerce_fic9/data/models/responses/auth_responses_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/auth_remote_datasource.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';
part 'login_bloc_bloc.freezed.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDataSource().login(event.data!);
      response.fold(
        (l) => emit(_Erorr(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
