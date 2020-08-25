class AppStartedAction {
  @override
  String toString() => '${AppStartedAction}()';
}

class OpenUrlAction {
  final String url;

  OpenUrlAction(this.url);

  @override
  String toString() => '${OpenUrlAction}($url)';
}
