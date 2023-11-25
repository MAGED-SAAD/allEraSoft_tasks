
abstract class NoteStates{}
class InitState extends NoteStates{}


class WrongAction extends NoteStates{}



class DataGetSuccess extends NoteStates {}

class IsLoading extends NoteStates {}

class AddNewNoteSuccess extends NoteStates {}

class AddNewNoteFailed extends NoteStates {
  String? error;
  AddNewNoteFailed({this.error});
}


class DeleteTaskSuccess extends NoteStates {}

class DisplayOneTaskSuccess extends NoteStates {}

class DisplayOneTaskFailed extends NoteStates {
  String? error;
  DisplayOneTaskFailed({this.error});
}


class GetDataFailed extends NoteStates {
  String? error;
  GetDataFailed({this.error});
}


class TaskEditesSuccessfuly extends NoteStates{}


class ChangeNoteStatus extends NoteStates{}