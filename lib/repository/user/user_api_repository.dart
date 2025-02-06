import 'package:git_gram/data/network/network_api.dart';
import 'package:git_gram/models/user/repository_model.dart';
import 'package:git_gram/models/user/user_model.dart';
import 'package:git_gram/utils/app_urls.dart';

class UserApiRepository {
  final _apiServices = NetworkApi();
  Future<UserModel> getUser(String userName) async {
    final response = await _apiServices.getApi(AppUrls.getUserUrl + userName);
    return UserModel.fromJson(response);
  }

  Future<List<RepositoryModel>> getRepos(String userName) async {
    final repoResponse =
        await _apiServices.getApi(AppUrls.getReposUrl(userName));
    return (repoResponse as List)
        .map((repo) => RepositoryModel.fromJson(repo))
        .toList();
  }
}
