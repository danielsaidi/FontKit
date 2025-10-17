<p align="center">
    <img src="Resources/Icon-Badge.png" alt="Project Icon" width="250" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/FontKit?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/badge/swift-6.1-orange.svg" alt="Swift 6.1" />
    <a href="https://danielsaidi.github.io/FontKit"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <a href="https://github.com/danielsaidi/FontKit/blob/master/LICENSE"><img src="https://img.shields.io/github/license/danielsaidi/FontKit" alt="MIT License" /></a>
    <a href="https://github.com/sponsors/danielsaidi"><img src="https://img.shields.io/badge/sponsor-GitHub-red.svg" alt="Sponsor my work" /></a>
</p>


# FontKit

FontKit is a Swift library that makes it easy to use custom fonts with SwiftUI, UIKit, and AppKit.

![FontKit Preview](Resources/Preview.png)



## Installation

FontKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/FontKit.git
```



## Support My Work

You can [become a sponsor][Sponsors] to help me dedicate more time on my various [open-source tools][OpenSource]. Every contribution, no matter the size, makes a real difference in keeping these tools free and actively developed.



## Getting Started

FontKit has a ``CustomFont`` struct that can be used to define and load custom font resources from any bundle.

For instance, this is how FontKit defines the four OpenDyslexic fonts that are embedded in the `.module` bundle:

```swift
public extension CustomFont {

    /// A regular OpenDyslexic font variant.
    static let openDyslexic = CustomFont(
        name: "OpenDyslexic-Regular",
        displayName: "OpenDyslexic Regular",
        fileExtension: "otf",
        bundle: .module
    )

    /// A bold OpenDyslexic font variant.
    static let openDyslexicBold = CustomFont(
        name: "OpenDyslexic-Bold",
        displayName: "OpenDyslexic Bold",
        fileExtension: "otf",
        bundle: .module
    )

    /// A bold italic OpenDyslexic font variant.
    static let openDyslexicBoldItalic = CustomFont(
        name: "OpenDyslexic-Bold-Italic",
        displayName: "OpenDyslexic Bold Italic",
        fileExtension: "otf",
        bundle: .module
    )

    /// An italic OpenDyslexic font variant.
    static let openDyslexicItalic = CustomFont(
        name: "OpenDyslexic-Italic",
        displayName: "OpenDyslexic Italic",
        fileExtension: "otf",
        bundle: .module
    )
}
```

You can use SwiftuI ``Font`` extensions to create ``CustomFont``-based fonts, or the ``.font(size:)`` builder to create fonts for UIKit and AppKit.



## Documentation

The online [documentation][Documentation] has more information, articles, code examples, etc.



## Demo Application

The `Demo` folder has a demo app that lets you test the library and its various fonts.



## Contact

Feel free to reach out if you have questions, or want to contribute in any way:

* Website: [danielsaidi.com][Website]
* E-mail: [daniel.saidi@gmail.com][Email]
* Bluesky: [@danielsaidi@bsky.social][Bluesky]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]



## License

FontKit is available under the MIT license. See the [LICENSE][License] file for more info.



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Bluesky]: https://bsky.app/profile/danielsaidi.bsky.social
[Mastodon]: https://mastodon.social/@danielsaidi
[Twitter]: https://twitter.com/danielsaidi

[Documentation]: https://danielsaidi.github.io/FontKit
[Getting-Started]: https://danielsaidi.github.io/FontKit/documentation/fontkit/getting-started
[License]: https://github.com/danielsaidi/FontKit/blob/master/LICENSE
