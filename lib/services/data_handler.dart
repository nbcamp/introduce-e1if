import 'dart:async';

class IO {
  FutureOr<void> Function(String payload) save;
  FutureOr<String?> Function() load;

  IO({
    required this.save,
    required this.load,
  });
}

mixin DataHandler {
  IO? io;

  FutureOr<void> import(String payload);
  FutureOr<String> export();

  Future<void> save() async {
    if (io == null) return Future.value();
    var payload = await export();
    io?.save(payload);
  }

  Future<void> load() async {
    if (io == null) return Future.value();
    var payload = await io!.load();
    if (payload == null) return;
    import(payload);
  }
}
