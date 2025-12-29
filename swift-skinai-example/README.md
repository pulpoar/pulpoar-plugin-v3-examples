# PulpoAR SkinAI v3 Integration - Swift/iOS Example

This example demonstrates how to integrate the PulpoAR SkinAI v3 plugin into a native iOS application using Swift and WKWebView.

## Features

- **Full SkinAI v3 integration**: Complete skin analysis experience in a native iOS app
- **18 Event handlers**: Real-time monitoring of all SDK events  
- **SwiftUI implementation**: Modern declarative UI
- **Camera permissions**: Automatic camera permission handling
- **No actions needed**: SkinAI v3 is a single-page experience

## Prerequisites

- macOS with Xcode 14+ installed
- iOS 14.0+ deployment target
- CocoaPods (if using dependencies)
- An iOS device or simulator

## Quick Start

### 1. Open the Project

```bash
# Navigate to the swift-skinai-example directory
cd swift-skinai-example

# Open the Xcode project
open swift-example.xcodeproj
```

### 2. Setup Permissions

The project already includes camera permissions in `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>We need camera access for skin analysis</string>
```

### 3. Build and Run

1. Select a target device/simulator in Xcode
2. Click the Run button (⌘R) or Product > Run
3. The app will build and launch automatically

## Viewing Event Logs

### Using Xcode Console

1. Run the app in Xcode
2. Open the Console pane (View > Debug Area > Activate Console)
3. Filter by `[SkinAI]` to see all events
4. Interact with the app to see events in real-time

### Example Console Output

```
[SkinAI] onReady: { projectKey = "demo"; themeType = "default"; }
[SkinAI] onPathChange: { path = "onboarding"; referer = "root"; }
[SkinAI] onOnboardingCarouselChange: { fromStep = 0; toStep = 1; }
[SkinAI] onQuestionnaireComplete: { ... }
[SkinAI] onSkinScoreCalculate: { skinHealthScore = 85; ... }
[SkinAI] onAddToCart: { products = [...]; experience = "skin-analysis"; }
```

## Project Structure

```
swift-skinai-example/
├── swift-example/
│   ├── PulpoAR/
│   │   ├── SDK.swift                    # SkinAI SDK event definitions
│   │   ├── PulpoARView.swift            # WKWebView integration
│   │   ├── PulpoARViewRepresentable.swift # SwiftUI wrapper
│   │   ├── Types.swift                  # Event type definitions
│   │   └── Utils.swift                  # Helper functions
│   ├── ContentView.swift                 # Main app view with event handlers
│   └── swift_exampleApp.swift           # App entry point
└── README.md                             # This file
```

## SDK Integration - 18 Events

All events are handled in `ContentView.swift`:

```swift
PulpoARViewRepresentable(
    props: PulpoARProps(
        plugin: "skinai",
        slug: "demo",
        events: Events(
            onReady: { data in print("[SkinAI] onReady:", data) },
            onError: { error in print("[SkinAI] onError:", error) },
            onPathChange: { data in print("[SkinAI] onPathChange:", data) },
            onOnboardingCarouselChange: { data in ... },
            onQuestionnaireComplete: { data in ... },
            onPhotoUse: { data in ... },
            onPhotoRetake: { data in ... },
            onSkinScoreCalculate: { data in ... },
            onExperienceChange: { data in ... },
            onRecommendationsReceive: { data in ... },
            onProductTryClick: { data in ... },
            onAISimulatorAdjust: { data in ... },
            onAddToCart: { data in ... },
            onProductVisit: { data in ... },
            onEmailButtonClick: { data in ... },
            onEmailSend: { data in ... },
            onCameraPermissionDeny: { data in ... },
            onProblemChipClick: { data in ... }
        )
    )
)
```

## Customization

### Change Plugin URL

Edit `ContentView.swift`:
```swift
plugin: "skinai",
slug: "YOUR_SLUG_HERE"  // Change this
```

### Custom Event Handling

Modify event handlers in `ContentView.swift`:
```swift
onAddToCart: { data in
    print("[SkinAI] onAddToCart:", data)
    // Add your custom logic here
    // - Add products to your cart system
    // - Send analytics events
    // - Show native iOS alert
}
```

### Subscribe to Specific Events

Remove event handlers you don't need:
```swift
Events(
    onReady: { ... },           // Keep this
    onSkinScoreCalculate: { ... },  // And this
    onAddToCart: { ... }        // And this
    // Remove others
)
```

## Troubleshooting

### Build errors
- Clean build folder: Product > Clean Build Folder (⇧⌘K)
- Delete derived data: Xcode > Preferences > Locations > Derived Data > Delete
- Restart Xcode

### Camera not working
- Grant camera permissions in Settings > Privacy > Camera
- Check Info.plist has NSCameraUsageDescription
- Test on a real device (simulators have limited camera support)

### Events not firing
- Check Xcode console for errors
- Verify internet connection
- Ensure plugin URL is correct

### Blank WebView
- Check internet connection
- Verify the plugin URL
- Look for SSL/certificate errors in console

## Minimum Requirements

- iOS 14.0+
- Xcode 14.0+
- Swift 5.0+
