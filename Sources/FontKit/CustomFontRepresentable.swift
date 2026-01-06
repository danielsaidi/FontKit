//
//  CustomFont.swift
//  FontKit
//
//  Created by Daniel Saidi on 2022-07-11.
//  Copyright © 2022-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This protocol can be implemented by any type that represent a custom font.
///
/// The `name` is the font name while `displayName` can be used to apply a
/// separate display name.
///
/// The `systemFontScaleFactor` property can define a font's scale factor,
/// as compared to the system font. If this factor is `1.2`, the font is 20% larger
/// than a system font. The font builders takes this scale factor into consideration,
/// and adjusts the requested size to the system font.
///
/// The static ``font(size:)`` builder can be used to create platform-specific
/// font values with the ``FontRepresentable`` umbrella typealias, while the
/// ``swiftUIFont(fixedSize:)`` and the other SwiftUI-specific extensions
/// can be used to create SwiftUI `Font` values. 
public protocol CustomFontRepresentable {

    /// The font name.
    var name: String { get }

    /// The font display name.
    var displayName: String { get }

    /// The approximate system font scale factor.
    var systemFontScaleFactor: Double { get }
}

public extension CustomFontRepresentable {

    /// Resolve a platform-specific font with a certain size.
    func font(size: CGFloat) -> FontRepresentable {
        let size = systemFontSize(for: size)
        let font = FontRepresentable(name: name, size: size)
        if let font { return font }
        fatalError("Unable to initialize font '\(name)'")
    }

    /// Transform a font size to match the system font size.
    func systemFontSize(for size: Double) -> Double {
        size / systemFontScaleFactor
    }

    /// Create a SwiftUI `Font` with a dynamic size.
    ///
    /// This font adapts to dynamic type.
    func swiftUIFont(dynamicSize size: CGFloat) -> Font {
        .dynamic(self, size: size)
    }

    /// Create a SwiftUI `Font` with a fixed size.
    ///
    /// This font ignores dynamic type.
    func swiftUIFont(fixedSize size: CGFloat) -> Font {
        .fixed(self, size: size)
    }

    /// Create a SwiftUI `Font` with a style-relative size.
    ///
    /// This font adapts to dynamic type.
    func swiftUIFont(size: CGFloat, relativeTo style: Font.TextStyle) -> Font {
        .relative(self, size: size, relativeTo: style)
    }
}

public extension Font {

    /// Create a custom font with a dynamic size.
    ///
    /// This font adapts to dynamic type.
    static func dynamic(
      _ font: any CustomFontRepresentable,
      size: CGFloat
    ) -> Font {
        .custom(font.name, size: font.systemFontSize(for: size))
    }

    /// Create a custom font with a fixed size.
    ///
    /// This font ignores dynamic type.
    static func fixed(
      _ font: any CustomFontRepresentable,
      size: CGFloat
    ) -> Font {
        .custom(font.name, fixedSize: font.systemFontSize(for: size))
    }

    /// Create a custom font with a style-relative size.
    ///
    /// This font adapts to dynamic type.
    static func relative(
        _ font: any CustomFontRepresentable,
        size: CGFloat,
        relativeTo style: Font.TextStyle
    ) -> Font {
        .custom(font.name, size: font.systemFontSize(for: size), relativeTo: style)
    }
}
