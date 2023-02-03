import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_example/features/Auth/data/Data%20Source/remote%20source/auth_remote_source.dart';
import 'package:mvvm_example/features/Auth/data/Data%20Source/remote%20source/auth_remote_sourceimp.dart';
import 'package:mvvm_example/features/Auth/data/repository/auth_repositoryImp.dart';
import 'package:mvvm_example/features/Auth/domain/repository/auth_repository.dart';
import 'package:mvvm_example/features/Auth/domain/usecase/auth_usecases.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_bloc.dart';

import '../features/Auth/presentation/pages/Auth/login_view.dart';



class MvvmExample extends StatelessWidget {
  const MvvmExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRemoteSourceImp()),
        RepositoryProvider(create: (context) => AuthRepositoryImp(authRemoteSource: RepositoryProvider.of<AuthRemoteSource>(context))),
        RepositoryProvider(create: (context) => AuthUseCase(authRepository: RepositoryProvider.of<AuthRepository>(context)))
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(authUseCases: RepositoryProvider.of<AuthUseCase>(context)),
        child:  MaterialApp(
          home: LoginView(),
        ),
      ),
    );
  }
}