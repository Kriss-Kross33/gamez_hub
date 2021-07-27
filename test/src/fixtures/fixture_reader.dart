import 'dart:io';

String fixture(String path) =>
    File('test/src/fixtures/$path').readAsStringSync();
