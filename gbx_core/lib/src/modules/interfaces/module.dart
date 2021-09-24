abstract class Module {
  const Module();

  Future<void> init();

  static Future initAll(List<Module> modules) {
    return Future.wait(modules.map((e) => e.init()));
  }
}
