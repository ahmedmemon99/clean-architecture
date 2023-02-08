import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_example/features/Auth/domain/entity/user.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_event.dart';
import 'package:mvvm_example/features/Auth/presentation/pages/Auth/bloc/auth_state.dart';
import '../../../../domain/usecase/auth_usecases.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{

  AuthUseCase authUseCases;

  AuthBloc({required this.authUseCases}): super(const AuthInitialState(isLoginMode: true)){
    on<AuthSignupEvent>(onAuthSignUpEvent);
    on<AuthSwitchEvent>(onSwitchEvent);
  }

  void onAuthSignUpEvent(AuthSignupEvent event,Emitter<AuthStates> emit)async{
    emit(const AuthLoadingState(isLoginMode: false));
    User user = await authUseCases.createUser(event.email, event.password);
  }

  void onSwitchEvent(AuthSwitchEvent event,Emitter<AuthStates> emit){
      if(state is AuthLoginState){
        emit(const AuthSigUpState(isLoginStatus: false));
      }else{
        emit(const AuthLoginState(isLoginStatus: true));
      }
  }




}