
abstract class LoginCubitStates{}
class InitState extends LoginCubitStates{}

class DataGetSuccess extends LoginCubitStates {}

class IsLoading extends LoginCubitStates {}

class GetDataFailed extends LoginCubitStates {
  String? error;
  GetDataFailed({this.error});
}

