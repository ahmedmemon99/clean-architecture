import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_example/features/Auth/domain/entity/user.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_event.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_state.dart';

import '../../../../domain/usecase/auth_usecases.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{

  AuthUseCase authUseCases;

  AuthBloc({required this.authUseCases}): super(AuthInitialState()){

    on<AuthLoginEvent>(onAuthLoginEvent);

  }


  void onAuthLoginEvent(AuthLoginEvent event,Emitter<AuthStates> emit)async{

    emit(AuthLoadingState());

    User user = await authUseCases.createUser(event.email, event.password);





  }




}