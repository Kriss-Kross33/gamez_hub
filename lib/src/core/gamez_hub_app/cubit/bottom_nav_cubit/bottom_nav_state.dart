part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  final int index;
  const BottomNavState({this.index = 0});

  @override
  List<Object> get props => [index];
}

// class BottomNavInitial extends BottomNavState {}
