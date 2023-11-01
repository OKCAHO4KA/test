import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reto/confiig/router/app_router.dart';
import 'package:reto/confiig/theme/app_theme.dart';
import 'package:reto/cubit/form_cubit_sender/form_cubit.dart';
import 'package:reto/presentation/providers/provider_principal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProvidrPrincipal()),
        BlocProvider(
          create: (context) => FormCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'Material App',
      ),
    );
  }
}
