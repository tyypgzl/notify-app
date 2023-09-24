enum AppRoutes {
  splash(path: '/'),
  onboard(path: '/onboard'),
  start(path: '/start'),
  login(path: '/login'),
  register(path: '/register'),
  dashboard(path: '/dashboard'),
  // Sub-Path
  todo(path: 'todo'),
  task(path: 'task'),
  note(path: 'note'),
  settingsWrapper(path: 'settings'),
  settings(path: ''),
  lanugage(path: 'language'),
  theme(path: 'theme'),
  ;

  const AppRoutes({required this.path});

  final String path;
}
