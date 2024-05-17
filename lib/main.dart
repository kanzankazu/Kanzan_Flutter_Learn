import 'package:belajar_flutter/common/utils/single_bloc_observer.dart';
import 'package:belajar_flutter/data/sources/local/user_local_source.dart';
import 'package:belajar_flutter/di/injections.dart';
import 'package:belajar_flutter/presentation/bloc/login/login_logout_bloc.dart';
import 'package:belajar_flutter/presentation/pages/home/home.dart';
import 'package:belajar_flutter/presentation/pages/login/pages/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  var userLocalSource = getIt<UserLocalSource>();
  var token = await userLocalSource.getToken();
  if (kDebugMode) print(token);
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});

  final String? token;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginLogoutBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: token == null ? const Login() : const Home(),
      ),
    ); //////
  }
}
