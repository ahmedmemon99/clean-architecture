import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_example/features/Auth/data/Data%20Source/remote%20source/auth_remote_source.dart';
import 'package:mvvm_example/features/Auth/data/Data%20Source/remote%20source/auth_remote_sourceimp.dart';
import 'package:mvvm_example/features/Auth/data/repository/auth_repositoryImp.dart';
import 'package:mvvm_example/features/Auth/domain/repository/auth_repository.dart';
import 'package:mvvm_example/features/Auth/domain/usecase/auth_usecases.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_bloc.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_event.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/login_viewmodel.dart';

import '../features/Auth/presentation/pages/Auth/login_view.dart';



class MvvmExample extends StatelessWidget {
  const MvvmExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginViewModel(authBloc: AuthBloc(authUseCases: AuthUseCase(authRepositoryImp: AuthRepositoryImp(authRemoteSource: AuthRemoteSourceImp())))),
      child:  BlocProvider(
        create: (context) => RepositoryProvider.of<LoginViewModel>(context).authBloc,
        child:  MaterialApp(
          home: LoginView(),
        ),
      ),
    );
  }
}