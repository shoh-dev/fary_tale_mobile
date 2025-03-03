import 'package:flutter/material.dart';
import 'package:myspace_data/myspace_data.dart';

import 'features/app/app.dart';
import 'manager/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final log = Log();

  final DependencyInjection di = DependencyInjection();

  FlutterError.onError = (details) {
    log.error(details.exception.toString());
    FlutterError.presentError(details);
  };

  final diResult = await di.init();

  diResult.when(
    ok: (_) {
      log.debug("DI initialized successfully!");
      runApp(StoreProvider(
        appStore: AppStore(
          initialState: AppState.initial(),
          di: di,
        ).createStore(),
        child: const App(),
      ));
    },
    error: (error) {
      log.error(error);
      throw error;
    },
  );
}
