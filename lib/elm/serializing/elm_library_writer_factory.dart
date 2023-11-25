import 'serializing.dart';

class ElmLibraryWriterFactory {
  const ElmLibraryWriterFactory._();

  static Iterator<ElmLibraryWriterProvider> _providers([bool refresh = false]) {
    // Simulating a provider list, replace this with your actual provider list logic
    var providerList = <ElmLibraryWriterProvider>[];
    if (refresh) {
      // Simulating a reload of providers (replace with actual reload logic)
      providerList.clear();
      providerList.addAll([
        // Updated list of ElmLibraryWriterProviders after reload
      ]);
    }
    return providerList.iterator;
  }

  static ElmLibraryWriter getWriter(String contentType) {
    var providers = _providers(false);
    if (providers.moveNext()) {
      var p = providers.current;
      if (providers.moveNext()) {
        throw Exception(
            "Multiple ElmLibraryWriterProviders found on the classpath. "
            "You need to remove a reference to either the 'elm-jackson' or the 'elm-jaxb' package");
      }
      return p.create(contentType);
    }
    throw Exception("No ElmLibraryWriterProviders found on the classpath. "
        "You need to add a reference to one of the 'elm-jackson' or 'elm-jaxb' packages, "
        "or provide your own implementation.");
  }
}
