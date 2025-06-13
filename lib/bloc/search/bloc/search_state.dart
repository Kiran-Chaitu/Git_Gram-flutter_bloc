part of 'search_bloc.dart';

class SearchState extends Equatable {
  final Status serchStatus;
  final ApiResponse userApiResponse;
  final ApiResponse userReposResponse;
  const SearchState(
      {this.serchStatus = Status.initial,
      this.userApiResponse = const ApiResponse.loading(),
      this.userReposResponse = const ApiResponse.loading()});
  SearchState copyWith({Status? serchStatus, ApiResponse? userApiResponse , ApiResponse? userReposResponse}) {
    return SearchState(
      userApiResponse: userApiResponse ?? this.userApiResponse,
      serchStatus: serchStatus ?? this.serchStatus,
      userReposResponse: userReposResponse ?? this.userReposResponse
    );
  }

  
  @override
  List<Object?> get props => [serchStatus, userApiResponse , userReposResponse];
}
