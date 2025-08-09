import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

/// Login cubit
@injectable
class HomeCubit extends Cubit<HomeState> {
  /// Constructor
  HomeCubit(this._addNewLog) : super(HomeState.initial()) {
    init();
  }

  final AddNewLog _addNewLog;

  /// Initialize home functions
  Future<void> init() async {
    emit(state.copyWith(processing: true));

    await Future<void>.delayed(const Duration(seconds: 1));

    emit(state.copyWith(processing: false));
  }

  /// Method to handle user logout
  Future<void> logOut() async {
    emit(state.copyWith(processing: true, logoutResult: null));

    // log the result
    const logParams = NewLogParams(
      type: LogType.login,
      method: LogMethod.logout,
      // parameters: {
      //   'email': state.email.value,
      //   'authStrategy': state.authStrategy.label,
      // },
      message: 'Logout successful',
    );
    await _addNewLog(logParams);

    await Future<void>.delayed(const Duration(seconds: 1));
    const Either<Failure, Unit> result = Right(unit);

    // leave the processing state as true to show the loading indicator
    emit(state.copyWith(logoutResult: result));
  }
}
