enum AppRoutes {
  splash(path: '/', name: 'splash'),
  onboard(path: '/onboard', name: 'onboard'),
  start(path: '/start', name: 'start'),
  login(path: '/login', name: 'login'),
  register(path: '/register', name: 'register'),
  home(path: '/home', name: 'home');

  const AppRoutes({required this.path, required this.name});

  final String path;
  final String name;
}
