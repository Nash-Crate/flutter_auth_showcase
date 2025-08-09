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
  HomeCubit() : super(HomeState.initial()) {
    init();
  }

  /// Initialize home functions
  Future<void> init() async {
    emit(state.copyWith(processing: true));

    await Future<void>.delayed(const Duration(seconds: 1));

    emit(state.copyWith(processing: false));
  }

  /// Method to handle user logout
  Future<void> logOut() async {
    emit(state.copyWith(processing: true, logoutResult: null));

    await Future<void>.delayed(const Duration(seconds: 1));
    const Either<Failure, Unit> result = Right(unit);

    // leave the processing state as true to show the loading indicator
    emit(state.copyWith(logoutResult: result));
  }
}
