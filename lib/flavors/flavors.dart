enum Flavor {
  mock,
  dev,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.mock:
        return '[MOCK] Pragma Catbreeds';
      case Flavor.dev:
        return '[DEV] Pragma Catbreeds';
      case Flavor.prod:
        return 'Pragma Catbreeds';
    }
  }
}

void ensureInitFlavor() {
  try {
    F.appFlavor;
  } catch (e) {
    if (e.toString().contains('LateInitializationError')) {
      // If not initialized, set a default value
      F.appFlavor = Flavor.prod;
    }
  }
}