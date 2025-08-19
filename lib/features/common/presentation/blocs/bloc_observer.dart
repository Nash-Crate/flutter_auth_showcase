import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/features/common/common.dart';

/// Global bloc observer
class MainBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    /// Global error notification
    showErrorNotification(error.toString());

    super.onError(bloc, error, stackTrace);
  }
}
