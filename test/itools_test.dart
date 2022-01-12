import 'package:flutter_test/flutter_test.dart';
import 'package:itools/log.dart';
void main() {
  test('printing info test', () {
    const msg = 'test message';
    printf(msg);
    expect(printf(msg), '💚 DEBUG tools_test.dart(8-12) - test message');

    printf(msg, mode: LogMode.info);
    expect(printf(msg, mode: LogMode.info),
        '💙 INFO tools_test.dart(11-12) - test message');
  });
}
