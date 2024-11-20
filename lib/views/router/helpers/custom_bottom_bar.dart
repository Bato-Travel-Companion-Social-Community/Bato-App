int getPageIndexOfBottomBar(String? fullPath) {
  switch (fullPath) {
    case '/my_community':
      return 0;
    case '/explore':
      return 1;
    case '/plan_trip':
      return 2;
    case '/my_profile':
      return 3;
    default:
      return -1; // Routes without a bottom navigation bar
  }
}
