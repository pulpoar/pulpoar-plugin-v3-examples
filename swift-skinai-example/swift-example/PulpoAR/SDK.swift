import WebKit

class PulpoARSDK {

    // WebView reference
    weak var webView: WKWebView?

    init(webView: WKWebView) {
        self.webView = webView
    }

    // SkinAI v3 has no actions - it's a single-page experience

    // Function to build SDK event scripts
    static func sdkEventBuilder(_ funcName: String) -> String {
        return """
        pulpoar['\(funcName)']((data)=>{
            window.webkit.messageHandlers.eventHandler.postMessage({event: "\(funcName)", data: data});
        });
        """
    }

    // SkinAI v3 Events

    static func onReady() -> String {
        return sdkEventBuilder("onReady")
    }

    static func onError() -> String {
        return sdkEventBuilder("onError")
    }

    static func onPathChange() -> String {
        return sdkEventBuilder("onPathChange")
    }

    static func onOnboardingCarouselChange() -> String {
        return sdkEventBuilder("onOnboardingCarouselChange")
    }

    static func onQuestionnaireComplete() -> String {
        return sdkEventBuilder("onQuestionnaireComplete")
    }

    static func onPhotoUse() -> String {
        return sdkEventBuilder("onPhotoUse")
    }

    static func onPhotoRetake() -> String {
        return sdkEventBuilder("onPhotoRetake")
    }

    static func onSkinScoreCalculate() -> String {
        return sdkEventBuilder("onSkinScoreCalculate")
    }

    static func onExperienceChange() -> String {
        return sdkEventBuilder("onExperienceChange")
    }

    static func onRecommendationsReceive() -> String {
        return sdkEventBuilder("onRecommendationsReceive")
    }

    static func onProductTryClick() -> String {
        return sdkEventBuilder("onProductTryClick")
    }

    static func onAISimulatorAdjust() -> String {
        return sdkEventBuilder("onAISimulatorAdjust")
    }

    static func onAddToCart() -> String {
        return sdkEventBuilder("onAddToCart")
    }

    static func onProductVisit() -> String {
        return sdkEventBuilder("onProductVisit")
    }

    static func onEmailButtonClick() -> String {
        return sdkEventBuilder("onEmailButtonClick")
    }

    static func onEmailSend() -> String {
        return sdkEventBuilder("onEmailSend")
    }

    static func onCameraPermissionDeny() -> String {
        return sdkEventBuilder("onCameraPermissionDeny")
    }

    static func onProblemChipClick() -> String {
        return sdkEventBuilder("onProblemChipClick")
    }

}
