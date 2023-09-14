enum AppRoutes {
  splash(path: '/', name: 'splash'),
  onboard(path: '/onboard', name: 'onboard'),
  start(path: '/start', name: 'start'),
  login(path: '/login', name: 'login'),
  register(path: '/register', name: 'register'),
  dashboard(path: '/dashboard', name: 'dashboard'),
  // Sub-Path
  todo(path: 'todo', name: 'todo'),
  task(path: 'task', name: 'task'),
  note(path: 'note', name: 'note'),
  settings(path: 'settings', name: 'settings');

  const AppRoutes({required this.path, required this.name});

  final String path;
  final String name;
}
