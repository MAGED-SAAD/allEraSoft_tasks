import 'package:flutter_bloc/flutter_bloc.dart';
import 'Counter_states.dart';

class Counter_cubit extends Cubit<Counter_states>{

  Counter_cubit():super(init_counter_state());


  int counter=0;

  static Counter_cubit get_object (context){
    return (BlocProvider.of<Counter_cubit>(context));
}

  void Increment(){
    counter+=1;
    emit(Increment_counter_state());
  }

  void Minus(){
    if(counter>0){
      counter-=1;
      emit(Minus_counter_state());
    }

  }

  void reset(){
    counter=0;
    emit(reset_counter_state());
  }

}