# Release Notes

[FontKit](https://github.com/danielsaidi/FontKit) will use semver after 1.0.

Until then, breaking changes can happen in minor versions.



## 0.2

### 💡 Adjustments

* The package now uses Swift 6.1. 
* The demo app now targets iOS 26.



## 0.1.4

### 💡 Adjustments

* OpenDyslexic Regular has an adjusted display name.



## 0.1.3

### ✨ Features

* ``CustomFontRepresentable`` is a new protocol for type agnostic font logic.



## 0.1.2

### ✨ Features

* ``CustomFont`` has a new system font scale factor.

### 💡 Adjustments

* ``CustomFont`` will use the new system font scale factor to render as big as the system font.



## 0.1.1

### ✨ Features

* ``CustomFont`` has new SwiftUI font builders.



## 0.1

This is the first version of FontKit.

### ✨ Features

* ``CustomFont`` can be used to create custom fonts.
* ``CustomFont+OpenDyslexic`` adds OpenDyslexic fonts to the custom font type.
