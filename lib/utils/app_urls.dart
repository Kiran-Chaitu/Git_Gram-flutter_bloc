class AppUrls {
  static const String gitImageUrl =
      'https://logos-world.net/wp-content/uploads/2020/11/GitHub-Symbol.png';

  static const String getUserUrl = 'https://api.github.com/users/';
  static String getReposUrl(String userId){ 
    return 'https://api.github.com/users/$userId/repos';
  }
  static String getFollowers(String userId){ 
    return 'https://api.github.com/users/$userId/followers';
  }
  static String getFollowing(String userId){ 
    return 'https://api.github.com/users/$userId/following';
  }

}
