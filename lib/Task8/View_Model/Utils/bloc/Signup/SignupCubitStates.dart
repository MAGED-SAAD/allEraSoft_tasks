
abstract class SignupCubitStates{}
class InitState extends SignupCubitStates{}



class DataGetSuccess extends SignupCubitStates {}

class IsLoading extends SignupCubitStates {}

class GetDataFailed extends SignupCubitStates {
  String? error;
  GetDataFailed({this.error});
}
