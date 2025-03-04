import 'package:flutter_exercises/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('User calculate', () {
    final users = [
      GenericUser("vb", "11", 10),
      GenericUser("vb", "11", 10),
      GenericUser("vb", "11", 20),
    ];

    final result =
        UserManagement(AdminUser("name", "id", 15, 1)).calculateMoney(users);

    final response =
        UserManagement(AdminUser("name", "id", 15, 1)).showName<String>(users);

    expect(result, 55);
  });
}
