import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState());

  int selectedIndex = 0;

  void onItemSelected(int index) {
    this.selectedIndex = index;
    print(index);
    emit(BottomNavState(index: selectedIndex));
  }
}
