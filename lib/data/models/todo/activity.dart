enum TodoActivity {
  active,
  completed;

  bool get boolValue => this == TodoActivity.active;

  TodoActivity get reverse => this == TodoActivity.active
      ? TodoActivity.completed
      : TodoActivity.active;
}
