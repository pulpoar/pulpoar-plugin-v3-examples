//
//  ContentView.swift
//  swift-skinai-example
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PulpoARViewRepresentable(
            props: PulpoARProps(
                plugin: "skinai",
                slug: "demo",
                events: Events(
                    onReady: { data in
                        print("[SkinAI] onReady:", data)
                    },
                    onError: { error in
                        print("[SkinAI] onError:", error)
                    },
                    onPathChange: { data in
                        print("[SkinAI] onPathChange:", data)
                    },
                    onOnboardingCarouselChange: { data in
                        print("[SkinAI] onOnboardingCarouselChange:", data)
                    },
                    onQuestionnaireComplete: { data in
                        print("[SkinAI] onQuestionnaireComplete:", data)
                    },
                    onPhotoUse: { data in
                        print("[SkinAI] onPhotoUse:", data)
                    },
                    onPhotoRetake: { data in
                        print("[SkinAI] onPhotoRetake:", data)
                    },
                    onSkinScoreCalculate: { data in
                        print("[SkinAI] onSkinScoreCalculate:", data)
                    },
                    onExperienceChange: { data in
                        print("[SkinAI] onExperienceChange:", data)
                    },
                    onRecommendationsReceive: { data in
                        print("[SkinAI] onRecommendationsReceive:", data)
                    },
                    onProductTryClick: { data in
                        print("[SkinAI] onProductTryClick:", data)
                    },
                    onAISimulatorAdjust: { data in
                        print("[SkinAI] onAISimulatorAdjust:", data)
                    },
                    onAddToCart: { data in
                        print("[SkinAI] onAddToCart:", data)
                    },
                    onProductVisit: { data in
                        print("[SkinAI] onProductVisit:", data)
                    },
                    onEmailButtonClick: { data in
                        print("[SkinAI] onEmailButtonClick:", data)
                    },
                    onEmailSend: { data in
                        print("[SkinAI] onEmailSend:", data)
                    },
                    onCameraPermissionDeny: { data in
                        print("[SkinAI] onCameraPermissionDeny:", data)
                    },
                    onProblemChipClick: { data in
                        print("[SkinAI] onProblemChipClick:", data)
                    }
                )
            )
        )
    }
}
