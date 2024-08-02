import 'dart:io';

String readJson(String name) => File('test/fixtures/stub_json/$name').readAsStringSync();