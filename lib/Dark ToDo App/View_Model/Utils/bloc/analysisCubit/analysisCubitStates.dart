
abstract class AnalysisCubitStates{}
class InitState extends AnalysisCubitStates{}


class DataAnalysisGetSuccess extends AnalysisCubitStates {}
class IsLoading extends AnalysisCubitStates {}


class GetAnalysisDataFailed extends AnalysisCubitStates {
  String? error;
  GetAnalysisDataFailed({this.error});
}

