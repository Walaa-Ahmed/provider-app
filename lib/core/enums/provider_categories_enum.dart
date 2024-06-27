

enum ProviderCategories { aboutUs ,services, package , gallery , review }

extension TypeExtension on ProviderCategories {
  String text() {
    switch (this) {
      case ProviderCategories.services:
        return 'Services';
      case ProviderCategories.aboutUs:
        return 'About Us';
      case ProviderCategories.package:
        return 'Package';
      case ProviderCategories.gallery:
        return 'Gallery';
      case ProviderCategories.review:
        return 'Review';
    }
  }


}

