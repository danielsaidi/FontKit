//
//  CustomFont+OpenDyslexic.swift
//  FontKit
//
//  Created by Daniel Saidi on 2025-07-07.
//  Copyright © 2022-2026 Daniel Saidi. All rights reserved.
//
//  Courtesy by OpenDyslexic.org
//  Please consider donating at https://opendyslexic.org
//

import SwiftUI

public extension CustomFont {

    /// A regular OpenDyslexic font variant.
    static let openDyslexic = openDyslexic(
        name: "OpenDyslexic-Regular",
        displayName: "OpenDyslexic"
    )

    /// A bold OpenDyslexic font variant.
    static let openDyslexicBold = openDyslexic(
        name: "OpenDyslexic-Bold",
        displayName: "OpenDyslexic Bold"
    )

    /// A bold italic OpenDyslexic font variant.
    static let openDyslexicBoldItalic = openDyslexic(
        name: "OpenDyslexic-Bold-Italic",
        displayName: "OpenDyslexic Bold Italic"
    )

    /// An italic OpenDyslexic font variant.
    static let openDyslexicItalic = openDyslexic(
        name: "OpenDyslexic-Italic",
        displayName: "OpenDyslexic Italic"
    )
}

private extension CustomFont {

    static func openDyslexic(
        name: String,
        displayName: String
    ) -> Self {
        .init(
            name: name,
            displayName: displayName,
            fileExtension: "otf",
            bundle: .module,
            systemFontScaleFactor: 1.1
        )
    }
}

public extension CustomFont {

    /// A collection of all OpenDyslexic font variants.
    static var openDyslexicFonts: [CustomFont] { .openDyslexicFonts }
}

public extension Collection where Element == CustomFont {

    /// A collection of all OpenDyslexic font variants.
    static var openDyslexicFonts: [Element] {
        [
            .openDyslexic,
            .openDyslexicBold,
            .openDyslexicItalic,
            .openDyslexicBoldItalic
        ]
    }
}

#Preview {

    let size = 15.0

    List {
        Text("OpenDyslexic")
            .font(.system(size: size))
        ForEach(CustomFont.openDyslexicFonts) { font in
            Text(font.displayName)
                .font(.fixed(font, size: size))
        }
    }
}
