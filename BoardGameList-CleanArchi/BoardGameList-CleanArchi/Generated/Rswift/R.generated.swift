//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 3 files.
  struct file {
    /// Resource file `Development.xcconfig`.
    static let developmentXcconfig = Rswift.FileResource(bundle: R.hostingBundle, name: "Development", pathExtension: "xcconfig")
    /// Resource file `Production.xcconfig`.
    static let productionXcconfig = Rswift.FileResource(bundle: R.hostingBundle, name: "Production", pathExtension: "xcconfig")
    /// Resource file `Staging.xcconfig`.
    static let stagingXcconfig = Rswift.FileResource(bundle: R.hostingBundle, name: "Staging", pathExtension: "xcconfig")

    /// `bundle.url(forResource: "Development", withExtension: "xcconfig")`
    static func developmentXcconfig(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.developmentXcconfig
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Production", withExtension: "xcconfig")`
    static func productionXcconfig(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.productionXcconfig
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Staging", withExtension: "xcconfig")`
    static func stagingXcconfig(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.stagingXcconfig
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = true

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 3 localization keys.
    struct localizable {
      /// Value: Description
      static let game_detail_description = Rswift.StringResource(key: "game_detail_description", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Players
      static let game_detail_players = Rswift.StringResource(key: "game_detail_players", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Popular game board
      static let game_list_title = Rswift.StringResource(key: "game_list_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Description
      static func game_detail_description(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("game_detail_description", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "game_detail_description"
        }

        return NSLocalizedString("game_detail_description", bundle: bundle, comment: "")
      }

      /// Value: Players
      static func game_detail_players(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("game_detail_players", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "game_detail_players"
        }

        return NSLocalizedString("game_detail_players", bundle: bundle, comment: "")
      }

      /// Value: Popular game board
      static func game_list_title(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("game_list_title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "game_list_title"
        }

        return NSLocalizedString("game_list_title", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R {
  fileprivate init() {}
}
