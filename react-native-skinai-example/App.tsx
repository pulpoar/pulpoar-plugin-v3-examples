import React, {useRef} from 'react';
import {SafeAreaView, StyleSheet} from 'react-native';
import {PulpoAR, Actions} from './pulpoar';

function App(): React.JSX.Element {
  const actionsRef = useRef<Actions>(null);

  return (
    <SafeAreaView style={styles.wrapper}>
      <PulpoAR
        plugin="skinai"
        slug="demo"
        actionsRef={actionsRef}
        onReady={payload => console.log('[SkinAI] Ready:', payload)}
        onError={payload => console.log('[SkinAI] Error:', payload)}
        onPathChange={payload => console.log('[SkinAI] Path changed:', payload)}
        onOnboardingCarouselChange={payload =>
          console.log('[SkinAI] Onboarding carousel changed:', payload)
        }
        onQuestionnaireComplete={payload =>
          console.log('[SkinAI] Questionnaire completed:', payload)
        }
        onPhotoUse={() => console.log('[SkinAI] Photo used')}
        onPhotoRetake={() => console.log('[SkinAI] Photo retake')}
        onSkinScoreCalculate={payload =>
          console.log('[SkinAI] Skin score calculated:', payload)
        }
        onExperienceChange={payload =>
          console.log('[SkinAI] Experience changed:', payload)
        }
        onRecommendationsReceive={payload =>
          console.log('[SkinAI] Recommendations received:', payload)
        }
        onProductTryClick={payload =>
          console.log('[SkinAI] Product try clicked:', payload)
        }
        onAISimulatorAdjust={payload =>
          console.log('[SkinAI] AI Simulator adjusted:', payload)
        }
        onAddToCart={payload => console.log('[SkinAI] Add to cart:', payload)}
        onProductVisit={payload =>
          console.log('[SkinAI] Product visited:', payload)
        }
        onEmailButtonClick={payload =>
          console.log('[SkinAI] Email button clicked:', payload)
        }
        onEmailSend={payload => console.log('[SkinAI] Email sent:', payload)}
        onCameraPermissionDeny={() =>
          console.log('[SkinAI] Camera permission denied')
        }
        onProblemChipClick={payload =>
          console.log('[SkinAI] Problem chip clicked:', payload)
        }
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({wrapper: {flex: 1}});

export default App;
