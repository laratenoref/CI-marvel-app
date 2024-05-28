import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "app_background" asset catalog image resource.
    static let appBackground = DeveloperToolsSupport.ImageResource(name: "app_background", bundle: resourceBundle)

    /// The "backgroundDiscover" asset catalog image resource.
    static let backgroundDiscover = DeveloperToolsSupport.ImageResource(name: "backgroundDiscover", bundle: resourceBundle)

    /// The "backgroundFavorites" asset catalog image resource.
    static let backgroundFavorites = DeveloperToolsSupport.ImageResource(name: "backgroundFavorites", bundle: resourceBundle)

    /// The "checked" asset catalog image resource.
    static let checked = DeveloperToolsSupport.ImageResource(name: "checked", bundle: resourceBundle)

    /// The "marvel_logo" asset catalog image resource.
    static let marvelLogo = DeveloperToolsSupport.ImageResource(name: "marvel_logo", bundle: resourceBundle)

    /// The "unchecked" asset catalog image resource.
    static let unchecked = DeveloperToolsSupport.ImageResource(name: "unchecked", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "app_background" asset catalog image.
    static var appBackground: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .appBackground)
#else
        .init()
#endif
    }

    /// The "backgroundDiscover" asset catalog image.
    static var backgroundDiscover: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .backgroundDiscover)
#else
        .init()
#endif
    }

    /// The "backgroundFavorites" asset catalog image.
    static var backgroundFavorites: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .backgroundFavorites)
#else
        .init()
#endif
    }

    /// The "checked" asset catalog image.
    static var checked: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .checked)
#else
        .init()
#endif
    }

    /// The "marvel_logo" asset catalog image.
    static var marvelLogo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .marvelLogo)
#else
        .init()
#endif
    }

    /// The "unchecked" asset catalog image.
    static var unchecked: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .unchecked)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "app_background" asset catalog image.
    static var appBackground: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .appBackground)
#else
        .init()
#endif
    }

    /// The "backgroundDiscover" asset catalog image.
    static var backgroundDiscover: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .backgroundDiscover)
#else
        .init()
#endif
    }

    /// The "backgroundFavorites" asset catalog image.
    static var backgroundFavorites: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .backgroundFavorites)
#else
        .init()
#endif
    }

    /// The "checked" asset catalog image.
    static var checked: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .checked)
#else
        .init()
#endif
    }

    /// The "marvel_logo" asset catalog image.
    static var marvelLogo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .marvelLogo)
#else
        .init()
#endif
    }

    /// The "unchecked" asset catalog image.
    static var unchecked: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .unchecked)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

