import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_hack_app/data/dio_settings.dart';
import 'package:mega_hack_app/data/repositories/credit_data_repository.dart';
import 'package:mega_hack_app/data/repositories/email_repository.dart';
import 'package:mega_hack_app/presentation/blocs/credit_bloc/credit_bloc.dart';
import 'package:mega_hack_app/presentation/blocs/email_bloc/email_bloc.dart';
import 'package:mega_hack_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => CreditDataRepositroy(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
        RepositoryProvider(
          create: (context) => EmailRepositroy(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CreditBloc(
              repositroy: RepositoryProvider.of<CreditDataRepositroy>(context),
            ),
          ),
          BlocProvider(
            create: (context) => EmailBloc(
                repositroy: RepositoryProvider.of<EmailRepositroy>(context)),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff1A1A1A),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Color(0xff1A1A1A),
            ),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
