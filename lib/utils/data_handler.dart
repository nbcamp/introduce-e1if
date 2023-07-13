abstract class IO {
  Future<void> save(String payload);
  Future<String?> load();
}

mixin DataHandler {
  IO? io;

  Future<void> import(String payload);
  Future<String> export();

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
