# SkinAI v3 Plugin SDK - HTML/JS Example

HTML/JavaScript integration example demonstrating SkinAI v3 plugin integration with event monitoring, SDK actions, and product interactions.

> **SDK Documentation**: For complete event documentation, type definitions, and integration guides, see the [main README](../README.md).

## Features

- **Full SkinAI v3 integration**: Complete skin analysis experience
- **Event logging**: Real-time monitoring of 17 SDK events
- **Collapsible event panel**: Toggle sidebar to maximize viewing area
- **SDK action controls**: Camera permissions, product interactions
- **Product integration**: AddToCart, ProductVisit, ProductTryClick event handlers

## Quick Start

```bash
npm install
npm run dev
```

Vite will start at `http://localhost:3000` and automatically open the demo page.

## Project Structure

```
skinai-html-js-example/
├── index.html         # Main demo page with full event logging
├── index.js           # SDK integration and event handlers
├── common.css         # Shared base styles and navigation
├── index.css          # Page-specific styles (same as makeup example)
├── vite.config.js     # Vite configuration
├── package.json       # Dependencies
└── README.md          # This file
```

## SDK Integration Reference

All 17 SDK events are logged on the demo page with timestamps and full payload details.

For complete event documentation with payloads and usage examples, see:
- **[SDK Events Reference](../README.md#sdk-events-17-total)** - All 17 events with detailed payloads
- **[Type Definitions](../README.md#type-definitions)** - ProductWithoutRoutines, RoutineWithoutProducts, etc.
- **[Integration Guide](../README.md#integration-guide)** - Step-by-step setup instructions

## Demo Page Features

**Left Panel: SkinAI Experience**
- Full-screen iframe with SkinAI plugin
- Complete flow: onboarding → questionnaire → photo → analysis → recommendations

**Right Panel: Events**
- **Events Tab**: Real-time event logging with timestamps and payload details
- **Collapsible sidebar**: Click the arrow button to toggle the events panel


## Integration Notes

1. **SDK Loading**: The SDK is loaded via CDN in the HTML:
   ```html
   <script src="https://cdn.jsdelivr.net/npm/@pulpoar/plugin-sdk@latest/dist/index.iife.js"></script>
   ```

2. **Event Subscription**: Subscribe to events before the SDK initializes:
   ```javascript
   pulpoar.onReady(data => {
     console.log('SDK Ready:', data)
   })
   ```

3. **Camera Permissions**: The SDK automatically requests camera permissions when navigating to the `take-photo` page.

4. **Product Integration**: Handle product events to integrate with your e-commerce platform:
   ```javascript
   pulpoar.onAddToCart(data => {
     // Add products to your cart
     console.log('Products to add:', data.products)
     console.log('Source:', data.source) // "routines" or "products"
     console.log('Experience:', data.experience) // "skin-analysis" or "ai-simulation"
   })

   pulpoar.onProductVisit(data => {
     // Navigate to product page
     window.location.href = `/product/${data.product.id}`
   })
   ```

## Browser Compatibility

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

Camera access requires HTTPS in production.
