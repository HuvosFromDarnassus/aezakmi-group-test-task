// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum Fonts {
  internal enum Roboto {
    internal static let black = FontConvertible(name: "Roboto-Black", family: "Roboto", path: "Roboto-Black.ttf")
    internal static let blackItalic = FontConvertible(name: "Roboto-BlackItalic", family: "Roboto", path: "Roboto-BlackItalic.ttf")
    internal static let bold = FontConvertible(name: "Roboto-Bold", family: "Roboto", path: "Roboto-Bold.ttf")
    internal static let boldItalic = FontConvertible(name: "Roboto-BoldItalic", family: "Roboto", path: "Roboto-BoldItalic.ttf")
    internal static let extraBold = FontConvertible(name: "Roboto-ExtraBold", family: "Roboto", path: "Roboto-ExtraBold.ttf")
    internal static let extraBoldItalic = FontConvertible(name: "Roboto-ExtraBoldItalic", family: "Roboto", path: "Roboto-ExtraBoldItalic.ttf")
    internal static let extraLight = FontConvertible(name: "Roboto-ExtraLight", family: "Roboto", path: "Roboto-ExtraLight.ttf")
    internal static let extraLightItalic = FontConvertible(name: "Roboto-ExtraLightItalic", family: "Roboto", path: "Roboto-ExtraLightItalic.ttf")
    internal static let italic = FontConvertible(name: "Roboto-Italic", family: "Roboto", path: "Roboto-Italic.ttf")
    internal static let light = FontConvertible(name: "Roboto-Light", family: "Roboto", path: "Roboto-Light.ttf")
    internal static let lightItalic = FontConvertible(name: "Roboto-LightItalic", family: "Roboto", path: "Roboto-LightItalic.ttf")
    internal static let medium = FontConvertible(name: "Roboto-Medium", family: "Roboto", path: "Roboto-Medium.ttf")
    internal static let mediumItalic = FontConvertible(name: "Roboto-MediumItalic", family: "Roboto", path: "Roboto-MediumItalic.ttf")
    internal static let regular = FontConvertible(name: "Roboto-Regular", family: "Roboto", path: "Roboto-Regular.ttf")
    internal static let semiBold = FontConvertible(name: "Roboto-SemiBold", family: "Roboto", path: "Roboto-SemiBold.ttf")
    internal static let semiBoldItalic = FontConvertible(name: "Roboto-SemiBoldItalic", family: "Roboto", path: "Roboto-SemiBoldItalic.ttf")
    internal static let thin = FontConvertible(name: "Roboto-Thin", family: "Roboto", path: "Roboto-Thin.ttf")
    internal static let thinItalic = FontConvertible(name: "Roboto-ThinItalic", family: "Roboto", path: "Roboto-ThinItalic.ttf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic]
  }
  internal enum RobotoCondensed {
    internal static let black = FontConvertible(name: "RobotoCondensed-Black", family: "Roboto Condensed", path: "Roboto_Condensed-Black.ttf")
    internal static let blackItalic = FontConvertible(name: "RobotoCondensed-BlackItalic", family: "Roboto Condensed", path: "Roboto_Condensed-BlackItalic.ttf")
    internal static let bold = FontConvertible(name: "RobotoCondensed-Bold", family: "Roboto Condensed", path: "Roboto_Condensed-Bold.ttf")
    internal static let boldItalic = FontConvertible(name: "RobotoCondensed-BoldItalic", family: "Roboto Condensed", path: "Roboto_Condensed-BoldItalic.ttf")
    internal static let extraBold = FontConvertible(name: "RobotoCondensed-ExtraBold", family: "Roboto Condensed", path: "Roboto_Condensed-ExtraBold.ttf")
    internal static let extraBoldItalic = FontConvertible(name: "RobotoCondensed-ExtraBoldItalic", family: "Roboto Condensed", path: "Roboto_Condensed-ExtraBoldItalic.ttf")
    internal static let extraLight = FontConvertible(name: "RobotoCondensed-ExtraLight", family: "Roboto Condensed", path: "Roboto_Condensed-ExtraLight.ttf")
    internal static let extraLightItalic = FontConvertible(name: "RobotoCondensed-ExtraLightItalic", family: "Roboto Condensed", path: "Roboto_Condensed-ExtraLightItalic.ttf")
    internal static let italic = FontConvertible(name: "RobotoCondensed-Italic", family: "Roboto Condensed", path: "Roboto_Condensed-Italic.ttf")
    internal static let light = FontConvertible(name: "RobotoCondensed-Light", family: "Roboto Condensed", path: "Roboto_Condensed-Light.ttf")
    internal static let lightItalic = FontConvertible(name: "RobotoCondensed-LightItalic", family: "Roboto Condensed", path: "Roboto_Condensed-LightItalic.ttf")
    internal static let medium = FontConvertible(name: "RobotoCondensed-Medium", family: "Roboto Condensed", path: "Roboto_Condensed-Medium.ttf")
    internal static let mediumItalic = FontConvertible(name: "RobotoCondensed-MediumItalic", family: "Roboto Condensed", path: "Roboto_Condensed-MediumItalic.ttf")
    internal static let regular = FontConvertible(name: "RobotoCondensed-Regular", family: "Roboto Condensed", path: "Roboto_Condensed-Regular.ttf")
    internal static let semiBold = FontConvertible(name: "RobotoCondensed-SemiBold", family: "Roboto Condensed", path: "Roboto_Condensed-SemiBold.ttf")
    internal static let semiBoldItalic = FontConvertible(name: "RobotoCondensed-SemiBoldItalic", family: "Roboto Condensed", path: "Roboto_Condensed-SemiBoldItalic.ttf")
    internal static let thin = FontConvertible(name: "RobotoCondensed-Thin", family: "Roboto Condensed", path: "Roboto_Condensed-Thin.ttf")
    internal static let thinItalic = FontConvertible(name: "RobotoCondensed-ThinItalic", family: "Roboto Condensed", path: "Roboto_Condensed-ThinItalic.ttf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic]
  }
  internal enum RobotoSemiCondensed {
    internal static let black = FontConvertible(name: "RobotoSemiCondensed-Black", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-Black.ttf")
    internal static let blackItalic = FontConvertible(name: "RobotoSemiCondensed-BlackItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-BlackItalic.ttf")
    internal static let bold = FontConvertible(name: "RobotoSemiCondensed-Bold", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-Bold.ttf")
    internal static let boldItalic = FontConvertible(name: "RobotoSemiCondensed-BoldItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-BoldItalic.ttf")
    internal static let extraBold = FontConvertible(name: "RobotoSemiCondensed-ExtraBold", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-ExtraBold.ttf")
    internal static let extraBoldItalic = FontConvertible(name: "RobotoSemiCondensed-ExtraBoldItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-ExtraBoldItalic.ttf")
    internal static let extraLight = FontConvertible(name: "RobotoSemiCondensed-ExtraLight", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-ExtraLight.ttf")
    internal static let extraLightItalic = FontConvertible(name: "RobotoSemiCondensed-ExtraLightItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-ExtraLightItalic.ttf")
    internal static let italic = FontConvertible(name: "RobotoSemiCondensed-Italic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-Italic.ttf")
    internal static let light = FontConvertible(name: "RobotoSemiCondensed-Light", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-Light.ttf")
    internal static let lightItalic = FontConvertible(name: "RobotoSemiCondensed-LightItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-LightItalic.ttf")
    internal static let medium = FontConvertible(name: "RobotoSemiCondensed-Medium", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-Medium.ttf")
    internal static let mediumItalic = FontConvertible(name: "RobotoSemiCondensed-MediumItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-MediumItalic.ttf")
    internal static let regular = FontConvertible(name: "RobotoSemiCondensed-Regular", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-Regular.ttf")
    internal static let semiBold = FontConvertible(name: "RobotoSemiCondensed-SemiBold", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-SemiBold.ttf")
    internal static let semiBoldItalic = FontConvertible(name: "RobotoSemiCondensed-SemiBoldItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-SemiBoldItalic.ttf")
    internal static let thin = FontConvertible(name: "RobotoSemiCondensed-Thin", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-Thin.ttf")
    internal static let thinItalic = FontConvertible(name: "RobotoSemiCondensed-ThinItalic", family: "Roboto SemiCondensed", path: "Roboto_SemiCondensed-ThinItalic.ttf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [Roboto.all, RobotoCondensed.all, RobotoSemiCondensed.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(macOS)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  internal func swiftUIFont(fixedSize: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, fixedSize: fixedSize)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  internal func swiftUIFont(size: CGFloat, relativeTo textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size, relativeTo: textStyle)
  }
  #endif

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate func registerIfNeeded() {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: family).contains(name) {
      register()
    }
    #elseif os(macOS)
    if let url = url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      register()
    }
    #endif
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    font.registerIfNeeded()
    self.init(name: font.name, size: size)
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, size: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size)
  }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, fixedSize: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, fixedSize: fixedSize)
  }

  static func custom(
    _ font: FontConvertible,
    size: CGFloat,
    relativeTo textStyle: SwiftUI.Font.TextStyle
  ) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size, relativeTo: textStyle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
