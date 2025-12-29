# SkinAI v3 Plugin SDK - React Native Example

React Native integration example demonstrating SkinAI v3 plugin integration with WebView, event monitoring, and TypeScript support for both iOS and Android.

> **SDK Documentation**: For complete event documentation, type definitions, and integration guides, see the [main README](../README.md).

## Features

- **Full SkinAI v3 integration**: Complete skin analysis experience
- **Event logging**: Real-time monitoring of 17 SDK events
- **Cross-platform**: Works on both iOS and Android
- **TypeScript support**: Full type safety for events and payloads
- **React Native WebView**: Native WebView integration with JavaScript bridge

## Prerequisites

- **Node.js**: 16+ and npm/yarn
- **React Native**: Development environment set up
- **For iOS**: macOS with Xcode 12+ and CocoaPods
- **For Android**: Android Studio and SDK (API 24+)

## Quick Start

### 1. Install Dependencies

```bash
npm install

# For iOS only
cd ios && pod install && cd ..
```

### 2. Run the App

```bash
# For iOS
npm run ios

# For Android
npm run android
```

## Project Structure

```
react-native-skinai-example/
├── App.tsx                      # Main app component with event handlers
├── pulpoar/
│   ├── index.ts                 # Exports
│   ├── pulpoar.tsx              # PulpoAR React component
│   ├── sdk.ts                   # Event definitions
│   ├── types.ts                 # TypeScript types
│   └── utils.ts                 # Helper functions
├── android/                     # Android native code
├── ios/                         # iOS native code
├── package.json                 # Dependencies
└── README.md                    # This file
```

## Viewing Events

All events are logged to the console with the `[SkinAI]` prefix.

### Metro Bundler Console
Events appear in the Metro bundler terminal in real-time.

### iOS - Xcode Console
1. Open the project in Xcode
2. Run the app
3. View logs in the console panel (Cmd + Shift + C)

### Android - Logcat
```bash
# View React Native logs
adb logcat *:S ReactNative:V ReactNativeJS:V

# Filter for SkinAI events
adb logcat | grep "\[SkinAI\]"
```

## SDK Integration Reference

All 17 SDK events are available as React component props with TypeScript support.

For complete SDK documentation, see:
- **[SDK Events Reference](../README.md#sdk-events-17-total)** - All 17 events with detailed payloads
- **[Type Definitions](../README.md#type-definitions)** - ProductWithoutRoutines, RoutineWithoutProducts, etc.
- **[Integration Guide](../README.md#integration-guide)** - General integration steps

### React Native Usage

The PulpoAR component accepts all events as props:

```typescript
<PulpoAR
  plugin="skinai"
  slug="demo"
  onReady={payload => console.log('[SkinAI] Ready:', payload)}
  onSkinScoreCalculate={payload => {
    console.log('[SkinAI] Score:', payload.skinHealthScore)
    console.log('[SkinAI] Issues:', payload.issues)
  }}
  onAddToCart={payload => {
    console.log('[SkinAI] Add to cart:', payload.products)
    // Add your cart logic here
  }}
  onProductVisit={payload => {
    // Navigate to product page
    navigation.navigate('Product', {id: payload.product.id})
  }}
  // ... other event handlers
/>
```

### TypeScript Types

Event payloads are fully typed. Import types from the common documentation or use type inference:

```typescript
import {PulpoAR} from './pulpoar';

// TypeScript will infer payload types
<PulpoAR
  onSkinScoreCalculate={payload => {
    // payload is typed as SkinScoreCalculateEventPayload
    const score: number = payload.skinHealthScore
    const isSelfie: boolean = payload.isSelfie
  }}
/>
```

## Customization

### Change Plugin URL

Edit `App.tsx`:
```typescript
<PulpoAR
  plugin="skinai"
  slug="YOUR_PROJECT_SLUG"  // Change this to your project slug
  ...
/>
```

### Custom Event Handling

Add your custom logic in event handlers:
```typescript
onAddToCart={payload => {
  console.log('[SkinAI] Add to cart:', payload)

  // Add to your cart system
  addToCart(payload.products)

  // Send analytics
  analytics.track('skinai_add_to_cart', {
    products: payload.products.map(p => p.id),
    source: payload.source
  })

  // Show native alert
  Alert.alert('Added to Cart', `Added ${payload.products.length} products`)
}}
```

### Subscribe to Specific Events

Only include the event props you need:
```typescript
<PulpoAR
  plugin="skinai"
  slug="demo"
  onReady={...}                   // Required for initialization
  onSkinScoreCalculate={...}      // Required for results
  onAddToCart={...}               // Required for e-commerce
  // Omit other events if not needed
/>
```

## Permissions

### iOS (Info.plist)
Already configured in `ios/[AppName]/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>This app requires camera access for skin analysis.</string>
```

### Android (AndroidManifest.xml)
Already configured in `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-feature android:name="android.hardware.camera" />
```

## Troubleshooting

### Metro Bundler Issues
```bash
# Reset cache
npm start -- --reset-cache

# Clear watchman
watchman watch-del-all
```

### iOS Build Errors
```bash
# Reinstall pods
cd ios && pod deintegrate && pod install && cd ..

# Clean build
cd ios && xcodebuild clean && cd ..
```

### Android Build Errors
```bash
# Clean build
cd android && ./gradlew clean && cd ..

# Clear gradle cache
cd android && ./gradlew cleanBuildCache && cd ..
```

### Camera Not Working
- **iOS**: Check camera usage description in Info.plist
- **Android**: Check camera permission in AndroidManifest.xml
- **Both**: Grant camera permissions in device Settings > App > Permissions

### Events Not Firing
- Check Metro bundler console for JavaScript errors
- Verify internet connection
- Ensure plugin slug is correct
- Check WebView console for errors

### WebView Blank Screen
- Verify internet connection
- Check plugin URL is correct
- Enable JavaScript in WebView (already configured)
- Check for CORS issues (should not apply to iframe)

## Platform-Specific Notes

### iOS
- Minimum iOS version: 12.0
- Camera requires physical device (simulator camera is limited)
- WebView uses WKWebView (default in React Native)

### Android
- Minimum SDK: API 24 (Android 7.0)
- Camera requires permission request at runtime
- WebView uses Android System WebView

## Browser Compatibility

Uses native WebView components:
- **iOS**: WKWebView (equivalent to Safari)
- **Android**: Android System WebView (Chromium-based)
