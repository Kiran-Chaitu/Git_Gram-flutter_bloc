part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchButton extends SearchEvent {
  final String userName;
  SearchButton({required this.userName});

  @override
  List<Object?> get props => [userName];
}

