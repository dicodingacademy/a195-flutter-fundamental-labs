// todo-03-action-06: create a static value to define
enum ActionPageEnum {
  add,
  edit;

  bool get isEdit => this == ActionPageEnum.edit;
}
