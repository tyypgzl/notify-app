enum TodoActivity {
  waiting,
  done;

  bool get boolValue => this == TodoActivity.done;

  TodoActivity get reverse =>
      this == TodoActivity.waiting ? TodoActivity.done : TodoActivity.waiting;
}
