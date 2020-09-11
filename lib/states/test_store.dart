import 'package:mobx/mobx.dart';

part 'test_store.g.dart';

class TestStore = TestStoreBase with _$TestStore;

abstract class TestStoreBase with Store {
  @observable
  int count1 = 1;

  @observable
  int count2 = 22;

  @action
  void increment1() {
    count1++;
  }

  @action
  void increment2() {
    count2++;
  }
}
