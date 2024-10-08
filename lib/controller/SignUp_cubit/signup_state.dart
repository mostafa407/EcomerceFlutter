abstract class SignUpState{}
class SignUpInitialState extends SignUpState{}
class SignUpLoadingState extends SignUpState{}
class SignUpSuccessState extends SignUpState{}
class SignUpErrorState extends SignUpState{

  String message;
  SignUpErrorState(this.message);
}
class ChnageObsecureSignUpState extends SignUpState{}