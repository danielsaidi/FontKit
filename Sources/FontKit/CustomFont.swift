//
//  CustomFont.swift
//  FontKit
//
//  Created by Daniel Saidi on 2022-07-11.
//  Copyright © 2022-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This struct can be used to load custom fonts from an app or Swift Package.
///
/// This struct implements ``CustomFontRepresentable`` to share custom
/// font logic between many font-specific types.
///
/// The static ``font(size:)`` builder can be used to create platform-specific
/// font values with the ``FontRepresentable`` umbrella typealias, while the
/// ``swiftUIFont(fixedSize:)`` and the other SwiftUI-specific extensions
/// can be used to create SwiftUI `Font` values.
public struct CustomFont: CustomFontRepresentable, Identifiable, Sendable {

    /// Create a custom font from a file folder.
    ///
    /// - Parameters:
    ///   - name: The font name.
    ///   - displayName: The font display name, by default `name`.
    ///   - family: The font family name, by default the first name segment.
    ///   - fileName: The font file name, by default `name`.
    ///   - fileExtension: The font file extension, by default `ttf`.
    ///   - bundle: The bundle in which the font file is located, by default `.main`.
    ///   - systemFontScaleFactor: The approximate system font scale factor, by default `1`.
    public init(
        name: String,
        displayName: String? = nil,
        family: String? = nil,
        fileName: String? = nil,
        fileExtension: String = "ttf",
        bundle: Bundle = .main,
        systemFontScaleFactor: Double = 1.2
    ) {
        self.name = name
        self.displayName = displayName ?? name
        self.family = family ?? name.defaultFamily
        self.fileName = fileName ?? name
        self.fileExtension = fileExtension
        self.bundle = bundle
        self.systemFontScaleFactor = systemFontScaleFactor
        registerIfNeeded()
    }

    /// The unique font identifier.
    public var id: String { name }

    /// The font name.
    public let name: String

    /// The font display name.
    public let displayName: String

    /// The font family name.
    public let family: String

    /// The font file name.
    public let fileName: String

    /// The font file extension.
    public let fileExtension: String

    /// The bundle in which the font file is located
    public let bundle: Bundle

    /// The approximate system font scale factor.
    public let systemFontScaleFactor: Double
}

private extension String {

    var defaultFamily: String {
        String(split(separator: "-").first ?? "")
    }
}

private extension CustomFont {

    var isRegistered: Bool {
        guard let url else { return false }
        #if os(macOS) && !targetEnvironment(macCatalyst)
        return CTFontManagerGetScopeForURL(url) == .none
        #else
        let names = UIFont.fontNames(forFamilyName: family)
        return names.contains(name)
        #endif
    }

    var url: CFURL? {
        bundle.url(
            forResource: fileName,
            withExtension: fileExtension
        ) as CFURL?
    }

    func registerIfNeeded() {
        guard let url, !isRegistered else { return }
        CTFontManagerRegisterFontsForURL(url, .process, nil)
    }
}
