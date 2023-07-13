import 'dart:async';

class IO {
  FutureOr<void> Function(String payload) save;
  FutureOr<String?> Function() load;

  IO({
    required this.save,
    required this.load,
  });
}

mixin Handler {
  IO? io;

  FutureOr<void> retrieve(String payload);
  FutureOr<String> store();

  Future<void> save() async {
    if (io == null) return Future.value();
    var payload = await store();
    io?.save(payload);
  }

  Future<void> load() async {
    if (io == null) return Future.value();
    var payload = await io!.load();
    if (payload == null) return;
    retrieve(payload);
  }
}
