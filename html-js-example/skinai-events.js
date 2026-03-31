// SkinAI SDK Event Subscriptions
function subscribeToSkinAIEvents() {
  pulpoar.onReady(payload => {
    console.log('SkinAI ready:', payload)
    logEvent('onReady', payload)
  })

  pulpoar.onError(error => logEvent('onError', error))
  pulpoar.onPathChange(payload => logEvent('onPathChange', payload))
  pulpoar.onGoBack(() => logEvent('onGoBack', {}))

  pulpoar.onAnalysisComplete(payload => logEvent('onAnalysisComplete', payload))
  pulpoar.onAnalysisStart(() => logEvent('onAnalysisStart', {}))
  
  pulpoar.onCameraPermissionDeny(() => logEvent('onCameraPermissionDeny', {}))
  pulpoar.onCameraSwitch(payload => logEvent('onCameraSwitch', payload))

  pulpoar.onProductSelect(payload => logEvent('onProductSelect', payload))
  pulpoar.onProductVisit(payload => {
    console.log('Product visit:', payload)
    logEvent('onProductVisit', payload)
  })

  pulpoar.onAddToCart(payload => {
    console.log('Products added to cart:', payload)
    logEvent('onAddToCart', payload)
  })
}
