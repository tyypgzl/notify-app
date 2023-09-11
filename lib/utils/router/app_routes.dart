enum AppRoutes {
  splash(location: '/', name: 'splash'),
  onboard(location: '/onboard', name: 'onboard'),
  start(location: '/start', name: 'start'),
  login(location: '/login', name: 'login'),
  register(location: '/register', name: 'register'),
  home(location: '/home', name: 'home');

  const AppRoutes({required this.location, required this.name});

  final String location;
  final String name;
}
