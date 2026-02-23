import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task_areeba/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TurkeyViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
