import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:git_gram/data/response/api_response.dart';
import 'package:git_gram/repository/user/user_api_repository.dart';
import 'package:git_gram/utils/enums.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final UserApiRepository userApiRepository;
  SearchBloc({required this.userApiRepository}) : super(SearchState()) {
    on<SearchButton>(_onSearch);
  }

  void _onSearch(SearchButton event, Emitter<SearchState> emit) async {
    emit(state.copyWith(serchStatus: Status.loading));
    try {
      debugPrint(state.serchStatus.toString());
      final userResponse = await userApiRepository.getUser(event.userName);
      final repoResponse = await userApiRepository.getRepos(event.userName);
      debugPrint(state.serchStatus.toString());
      emit(state.copyWith(
          serchStatus: Status.success,
          userApiResponse: ApiResponse.success(userResponse),
          userReposResponse: ApiResponse.success(repoResponse)));
    } catch (error) {
      emit(state.copyWith(
          serchStatus: Status.failure,
          userApiResponse: ApiResponse.failure(error.toString()),
          userReposResponse: ApiResponse.failure(error.toString())));
    }
  }
}
