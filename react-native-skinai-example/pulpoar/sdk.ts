// SkinAI v3 has no actions - it's a single-page experience

const onReady = (_payload: any): void => undefined;

const onError = (_payload: any): void => undefined;

const onPathChange = (_payload: any): void => undefined;

const onOnboardingCarouselChange = (_payload: any): void => undefined;

const onQuestionnaireComplete = (_payload: any): void => undefined;

const onPhotoUse = (_payload: undefined): void => undefined;

const onPhotoRetake = (_payload: undefined): void => undefined;

const onSkinScoreCalculate = (_payload: any): void => undefined;

const onExperienceChange = (_payload: any): void => undefined;

const onRecommendationsReceive = (_payload: any): void => undefined;

const onProductTryClick = (_payload: any): void => undefined;

const onAISimulatorAdjust = (_payload: any): void => undefined;

const onAddToCart = (_payload: any): void => undefined;

const onProductVisit = (_payload: any): void => undefined;

const onEmailButtonClick = (_payload: any): void => undefined;

const onEmailSend = (_payload: any): void => undefined;

const onCameraPermissionDeny = (_payload: undefined): void => undefined;

const onProblemChipClick = (_payload: any): void => undefined;

export const sdk = {
  actions: {}, // No actions for SkinAI v3
  events: {
    onReady,
    onError,
    onPathChange,
    onOnboardingCarouselChange,
    onQuestionnaireComplete,
    onPhotoUse,
    onPhotoRetake,
    onSkinScoreCalculate,
    onExperienceChange,
    onRecommendationsReceive,
    onProductTryClick,
    onAISimulatorAdjust,
    onAddToCart,
    onProductVisit,
    onEmailButtonClick,
    onEmailSend,
    onCameraPermissionDeny,
    onProblemChipClick,
  },
};
