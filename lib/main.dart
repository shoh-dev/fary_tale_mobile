import 'package:fairy_tale_app/features/app/app.dart';
import 'package:fairy_tale_app/manager/redux.dart';
import 'package:flutter/material.dart';
import 'package:myspace_data/myspace_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final log = Log();

  final di = DependencyInjection();

  FlutterError.onError = (details) {
    log.error(details.exception.toString());
    FlutterError.presentError(details);
  };

  final diResult = await di.init();

  diResult.when(
    ok: (_) {
      log.debug('DI initialized successfully!');
      runApp(
        StoreProvider(
          appStore: AppStore(
            initialState: AppState.initial(),
            di: di,
          ).createStore(),
          child: const App(),
        ),
      );
    },
    error: (error) {
      log.error(error);
      throw error;
    },
  );
}
