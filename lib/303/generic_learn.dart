class UserManagement<T extends AdminUser> {

  final T admin;

  UserManagement(this.admin);

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;

    for (var item in users) {
      sum += item.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(
        initialValue, (previousValue, elemenet) => previousValue + elemenet);

    final _money = users.fold(initialValue, (previousValue, elemenet) => previousValue + elemenet.money);
    return _money;
  }
  
  Iterable<MyModels<R>>? showName<R>(List<GenericUser> users) {

    if (R == String) {
      final names = users.map((e) => MyModels<R>(e.name.split('').toList().cast<R>()));
      return names;
    }

    return null;

  }
}

class MyModels<T> {
  final String name = "vb";
  final List<T> items;

  MyModels(this.items);
}


class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}


class AdminUser extends GenericUser {

  final int role;

  AdminUser(super.name, super.id, super.money, this.role);


}

