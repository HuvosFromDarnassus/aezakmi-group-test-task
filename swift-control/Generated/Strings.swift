// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Common {
    /// Cancel
    internal static let cancel = Strings.tr("Localizable", "common.cancel", fallback: "Cancel")
    /// Continue
    internal static let `continue` = Strings.tr("Localizable", "common.continue", fallback: "Continue")
    /// Try again
    internal static let tryAgain = Strings.tr("Localizable", "common.tryAgain", fallback: "Try again")
  }
  internal enum Connection {
    /// Your device not found?
    internal static let notFound = Strings.tr("Localizable", "connection.notFound", fallback: "Your device not found?")
    /// Connected
    internal static let searching = Strings.tr("Localizable", "connection.searching", fallback: "Connected")
    /// Make sure your TV is turned on and connected to the same Wi-Fi network
    internal static let subtitle = Strings.tr("Localizable", "connection.subtitle", fallback: "Make sure your TV is turned on and connected to the same Wi-Fi network")
    /// Connect to TV
    internal static let title = Strings.tr("Localizable", "connection.title", fallback: "Connect to TV")
    internal enum Alert {
      internal enum Disconnect {
        /// Disconnect
        internal static let action = Strings.tr("Localizable", "connection.alert.disconnect.action", fallback: "Disconnect")
        /// You can connect again by tapping on the device card
        internal static let message = Strings.tr("Localizable", "connection.alert.disconnect.message", fallback: "You can connect again by tapping on the device card")
        /// Disconnect from TV?
        internal static let title = Strings.tr("Localizable", "connection.alert.disconnect.title", fallback: "Disconnect from TV?")
      }
    }
    internal enum Pairing {
      /// The code was entered incorrectly
      internal static let error = Strings.tr("Localizable", "connection.pairing.error", fallback: "The code was entered incorrectly")
      /// Enter the PIN displayed on your TV
      internal static let subtitle = Strings.tr("Localizable", "connection.pairing.subtitle", fallback: "Enter the PIN displayed on your TV")
      /// Pairing with device 
      internal static let title = Strings.tr("Localizable", "connection.pairing.title", fallback: "Pairing with device ")
    }
    internal enum Status {
      /// Searching...
      internal static let connected = Strings.tr("Localizable", "connection.status.connected", fallback: "Searching...")
      /// Connection...
      internal static let connection = Strings.tr("Localizable", "connection.status.connection", fallback: "Connection...")
      /// Not connected
      internal static let disconnected = Strings.tr("Localizable", "connection.status.disconnected", fallback: "Not connected")
      /// Сonnection error. Try again
      internal static let error = Strings.tr("Localizable", "connection.status.error", fallback: "Сonnection error. Try again")
    }
  }
  internal enum Instruction {
    /// All set! Your phone is now a TV remote
    internal static let five = Strings.tr("Localizable", "instruction.five", fallback: "All set! Your phone is now a TV remote")
    /// Wait for connection
    internal static let four = Strings.tr("Localizable", "instruction.four", fallback: "Wait for connection")
    /// Connect your phone and TV to the same Wi-Fi network
    internal static let one = Strings.tr("Localizable", "instruction.one", fallback: "Connect your phone and TV to the same Wi-Fi network")
    /// Open your favorite services via your phone
    internal static let six = Strings.tr("Localizable", "instruction.six", fallback: "Open your favorite services via your phone")
    /// Find your TV in the list and select it
    internal static let three = Strings.tr("Localizable", "instruction.three", fallback: "Find your TV in the list and select it")
    /// Instruction
    internal static let title = Strings.tr("Localizable", "instruction.title", fallback: "Instruction")
    /// Allow access to the Local Network
    internal static let two = Strings.tr("Localizable", "instruction.two", fallback: "Allow access to the Local Network")
  }
  internal enum Main {
    internal enum Alert {
      internal enum Permission {
        internal enum LocalNetwork {
          /// Settings
          internal static let action = Strings.tr("Localizable", "main.alert.permission.localNetwork.action", fallback: "Settings")
          /// Please go to settings and allow access. This will let the app find and connect to your Smart TV
          internal static let message = Strings.tr("Localizable", "main.alert.permission.localNetwork.message", fallback: "Please go to settings and allow access. This will let the app find and connect to your Smart TV")
          /// No access to the Local Network
          internal static let title = Strings.tr("Localizable", "main.alert.permission.localNetwork.title", fallback: "No access to the Local Network")
        }
      }
    }
    internal enum StatusBar {
      /// Disconnected
      internal static let disconnected = Strings.tr("Localizable", "main.statusBar.disconnected", fallback: "Disconnected")
      /// Connect to TV
      internal static let notSelected = Strings.tr("Localizable", "main.statusBar.notSelected", fallback: "Connect to TV")
    }
  }
  internal enum Onboarding {
    internal enum Review {
      internal enum First {
        /// 2m ago • Emily R. 
        internal static let dateAndName = Strings.tr("Localizable", "onboarding.review.first.dateAndName", fallback: "2m ago • Emily R. ")
        /// Set up in seconds. Haven't touched my physical remote in weeks.
        internal static let text = Strings.tr("Localizable", "onboarding.review.first.text", fallback: "Set up in seconds. Haven't touched my physical remote in weeks.")
        /// Works perfectly with my LG TV!
        internal static let title = Strings.tr("Localizable", "onboarding.review.first.title", fallback: "Works perfectly with my LG TV!")
      }
      internal enum Second {
        /// 3w ago • James K.
        internal static let dateAndName = Strings.tr("Localizable", "onboarding.review.second.dateAndName", fallback: "3w ago • James K.")
        /// Lost my remote last month. This app saved me time on a replacement
        internal static let text = Strings.tr("Localizable", "onboarding.review.second.text", fallback: "Lost my remote last month. This app saved me time on a replacement")
        /// So convenient
        internal static let title = Strings.tr("Localizable", "onboarding.review.second.title", fallback: "So convenient")
      }
      internal enum Third {
        /// 4m ago • Robert T.
        internal static let dateAndName = Strings.tr("Localizable", "onboarding.review.third.dateAndName", fallback: "4m ago • Robert T.")
        /// Been using it daily for 4 months
        internal static let text = Strings.tr("Localizable", "onboarding.review.third.text", fallback: "Been using it daily for 4 months")
        /// No complaints
        internal static let title = Strings.tr("Localizable", "onboarding.review.third.title", fallback: "No complaints")
      }
    }
    internal enum Subtitle {
      /// Turn on the TV, adjust the volume and navigate through apps with just one tap
      internal static let first = Strings.tr("Localizable", "onboarding.subtitle.first", fallback: "Turn on the TV, adjust the volume and navigate through apps with just one tap")
      /// Do you like the app? Rate us — your feedback helps us develop the app
      internal static let second = Strings.tr("Localizable", "onboarding.subtitle.second", fallback: "Do you like the app? Rate us — your feedback helps us develop the app")
      /// Dive into the content you love — no need to waste time searching
      internal static let third = Strings.tr("Localizable", "onboarding.subtitle.third", fallback: "Dive into the content you love — no need to waste time searching")
    }
    internal enum Title {
      /// Control your TV from your smartphone
      internal static let first = Strings.tr("Localizable", "onboarding.title.first", fallback: "Control your TV from your smartphone")
      /// We are constantly improving our app
      internal static let second = Strings.tr("Localizable", "onboarding.title.second", fallback: "We are constantly improving our app")
      /// Launch your favorite TV services using the app
      internal static let third = Strings.tr("Localizable", "onboarding.title.third", fallback: "Launch your favorite TV services using the app")
    }
  }
  internal enum Paywall {
    /// Privacy Policy
    internal static let privacy = Strings.tr("Localizable", "paywall.privacy", fallback: "Privacy Policy")
    /// Restore
    internal static let restore = Strings.tr("Localizable", "paywall.restore", fallback: "Restore")
    /// Subscribe to unlock all the features just for %@
    internal static func subtitle(_ p1: Any) -> String {
      return Strings.tr("Localizable", "paywall.subtitle", String(describing: p1), fallback: "Subscribe to unlock all the features just for %@")
    }
    /// Terms of Use
    internal static let terms = Strings.tr("Localizable", "paywall.terms", fallback: "Terms of Use")
    /// Get quick access to any service on TV
    internal static let title = Strings.tr("Localizable", "paywall.title", fallback: "Get quick access to any service on TV")
    internal enum Feature {
      /// Access to video services on TV
      internal static let first = Strings.tr("Localizable", "paywall.feature.first", fallback: "Access to video services on TV")
      /// Access to the mute function
      internal static let second = Strings.tr("Localizable", "paywall.feature.second", fallback: "Access to the mute function")
    }
    internal enum Subtitle {
      /// Subscribe to unlock all the features just for %@ with a 3 days free trial
      internal static func withTrial(_ p1: Any) -> String {
        return Strings.tr("Localizable", "paywall.subtitle.withTrial", String(describing: p1), fallback: "Subscribe to unlock all the features just for %@ with a 3 days free trial")
      }
    }
    internal enum Trial {
      /// Enable a 3 days free trial
      internal static let disabled = Strings.tr("Localizable", "paywall.trial.disabled", fallback: "Enable a 3 days free trial")
      /// 3 days free trial enabled
      internal static let enabled = Strings.tr("Localizable", "paywall.trial.enabled", fallback: "3 days free trial enabled")
    }
  }
  internal enum Settings {
    /// Instruction
    internal static let instruction = Strings.tr("Localizable", "settings.instruction", fallback: "Instruction")
    /// Privacy Policy
    internal static let privacy = Strings.tr("Localizable", "settings.privacy", fallback: "Privacy Policy")
    /// Share App
    internal static let share = Strings.tr("Localizable", "settings.share", fallback: "Share App")
    /// Support
    internal static let support = Strings.tr("Localizable", "settings.support", fallback: "Support")
    /// Terms of Use
    internal static let terms = Strings.tr("Localizable", "settings.terms", fallback: "Terms of Use")
    /// Settings
    internal static let title = Strings.tr("Localizable", "settings.title", fallback: "Settings")
  }
  internal enum Splash {
    /// Smart Remote Control for LG
    internal static let title = Strings.tr("Localizable", "splash.title", fallback: "Smart Remote Control for LG")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
