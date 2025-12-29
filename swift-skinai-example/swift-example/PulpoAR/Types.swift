import Foundation

struct PathChangePayload: Codable {
    let path: String
    let referer: String
    init(path: String?, referer: String?) {
        self.path = path!
        self.referer = referer!
    }
}

struct AddToCartPayload: Codable {
    let barcode: String?
    let config: Config?
    let id: String?
    let image: String?
    let name: String?
    let product: Product
    let slug: String?
    let thumbnailColor: String?
    let thumbnailImage: String?
    let translations: [Translation]
    let webLink: String?
    init(_ object:[String: Any], product: [String: Any]) {
        self.barcode = object["barcode"] as? String
        self.config = Config(object["config"] as! [String:Any])
        self.id = object["id"] as? String
        self.image = object["image"] as? String
        self.name = object["name"] as? String
        self.product = Product(product, brand: product["brand"] as! [String:Any], category: product["category"] as! [String:Any])
        self.slug = object["slug"] as? String
        self.thumbnailColor = object["thumbnail_color"] as? String
        self.thumbnailImage = object["thumbnail_image"] as? String
        self.translations = []
        self.webLink = object["web_link"] as? String
    }
}

struct Config: Codable {
    var config: ConfigDetails?
    var module: String?
    init(_ object:[String: Any]) {
        self.config = ConfigDetails(object["config"] as! [String:Any])
        self.module = object["module"] as? String
    }
}

struct ConfigDetails: Codable {
    var colors: [Color]?
    var config: ConfigSettings?
    var opacityMultiplier: Int?
    var subType: Int?
    var textureIdsToApply: [Texture]?
    var textureIdsToFetch: [Texture]?
    var type: Int?
    
    init(_ object:[String: Any]) {
        self.colors = (object["colors"] as! [[String: Any]]).map({colorInfo -> Color in
            return Color(colorInfo )})
      
        self.opacityMultiplier = object["opacity_multiplier"] as? Int
        self.subType = object["sub_type"] as? Int
        self.textureIdsToApply = (object["texture_ids_to_apply"] as! [[String: Any]]).map({textureInfo -> Texture in
            return Texture(textureInfo )})
        self.textureIdsToFetch = (object["texture_ids_to_fetch"] as! [[String: Any]]).map({textureInfo -> Texture in
            return Texture(textureInfo )})
        self.type = object["type"] as? Int
        guard let configData = object["config"] as? [String: Any] else {
            self.config = ConfigSettings([:])
            return 
        }
        self.config = ConfigSettings(configData)
    }
}


struct ConfigSettings: Codable {
    var darknessOpacity: String?
    var darknessSmooth: Int?
    var lightnessOpacity: String?
    var lightnessSmooth: Int?
    var lipstickLookType: String?
    var mascaraType: Int?
    var coverageRate: String?
    init(_ object:[String: Any]) {
        self.darknessOpacity = object["darkness_opacity"] as? String ?? ""
        self.darknessSmooth = object["darkness_smooth"] as? Int ?? 0
        self.lightnessOpacity = object["lightness_opacity"] as? String ?? ""
        self.lightnessSmooth = object["lightness_smooth"] as? Int ?? 0
        self.lipstickLookType = object["lipsticklook_type"] as? String ?? ""
        self.mascaraType = object["mascara_type"] as? Int ?? 0
        self.coverageRate = object["coverage_rate"] as? String ?? ""
    }
}

struct Texture: Codable {
    var id: String?
    var url: String?
    init(_ object:[String: Any]) {
        self.id = object["id"] as? String
        self.url = object["url"] as? String
    }
}

struct AppliedVariantsChangePayload: Codable {
    let triggererVariantId: String
    let variants: [Variant]
    init(triggererVariantId: String, variants: [Variant]) {
        self.triggererVariantId = triggererVariantId
        self.variants = variants
    }
}

struct Color: Codable {
    let blend: Int
    let color: String
    let opacity: String
    init(_ object:[String: Any]) {
        self.blend = (object["blend"] as? Int)!
        self.color = (object["color"] as? String)!
        self.opacity = (object["color"] as? String)!
    }
}

struct ModelSelectPayload: Codable {
    let id: Int
    let image: String
}

struct ZoomPayload: Codable {
    let type: String
    let value: Double
}

struct GDPRApprovePayload: Codable {
    let approved: Bool
}

struct TryNowClickPayload: Codable {
    let fallback: String
}

struct OpacitySlidePayload: Codable {
    let percentage: Double
}

struct CameraMirrorPayload: Codable {
    let activate: Bool
}


struct ProductSelectPayload: Codable {
    let brand: Brand
    let category: Category
    let id: String
    let image: String
    let name: String
    let slug: String?
    let translations: [Translation]
    let variants: [Variant]
}

struct CurtainSliderPayload: Codable {
    let posX: Double
}

struct CurtainTogglePayload: Codable {
    let active: Bool
}

struct ExperienceSelectPayload: Codable {
    let type: String
}

struct LookSelectPayload: Codable {
    let id: String
    let image: String
    let name: String
    let translations: [Translation]
    let variants: [Variant]
    init(_ object:[String: Any], variants: [Variant]) {
        self.id = object["id"] as! String
        self.image = object["image"] as! String
        self.name = object["name"] as! String
        self.translations = []
        self.variants = variants
    }
}

struct ApplicationData: Codable {
    let brands: [Brand]
    let categories: [Category]
    let module: String
    let products: [Product]
    let projectId: String
    let themeType: String
    let variants: [Variant]
    init(brands: [Brand], categories: [Category], module: String, products: [Product], projectId: String, themeType: String, variants: [Variant]) {
        self.brands = brands
        self.categories = categories
        self.module = module
        self.products = products
        self.projectId = projectId
        self.themeType = themeType
        self.variants = variants
    }
}

struct Translation: Codable {
    let description: String
    let id: Int
    let languagesCode: String
    let name: String
    let vtoCategoriesId: String
    init(description: String, id: Int, languagesCode: String, name: String, vtoCategoriesId: String) {
        self.description = description
        self.id = id
        self.languagesCode = languagesCode
        self.name = name
        self.vtoCategoriesId = vtoCategoriesId
    }
}

struct Category: Codable {
    let id: String
    let image: String
    let name: String
    let slug: String?
    let translations: [Translation]
    init(_ object:[String: Any]) {
        self.id = object["id"] as! String
        self.image = object["image"] as! String
        self.name = object["name"] as! String
        self.slug = object["slug"] as? String
        self.translations = []
    }
}

struct Brand: Codable {
    let id: String
    let image: String
    let name: String
    let slug: String?
    let translations: [Translation]
    init(_ object:[String: Any]){
        
        self.id = object["id"] as! String
        self.image = object["image"] as! String
        self.name = object["name"]  as! String
        self.slug = object["slug"] as? String
        self.translations = []
    }
}

struct Product: Codable {
    let brand: Brand
    let category: Category
    let id: String
    let image: String
    let name: String
    let slug: String?
    let translations: [Translation]
    init(_ object: [String: Any], brand: [String: Any], category: [String: Any]) {
        self.brand = Brand(brand)
        self.category = Category(category)
        self.id = object["id"] as! String
        self.image = object["image"] as! String
        self.name = object["name"] as! String
        self.slug = object["slug"] as? String
        self.translations = []
    }
}

struct Variant: Codable {
    let barcode: String?
    let config: Config
    let id: String
    let image: String?
    let name: String
    let product: Product
    let slug: String?
    let thumbnailColor: String?
    let thumbnailImage: String?
    let translations: [Translation]
    let webLink: String?
    
    init(_ object: [String: Any], product: [String: Any]) {
        self.id = object["id"] as! String
        self.image = object["image"] as? String
        self.name = object["name"] as! String
        self.slug = object["slug"] as? String
        self.barcode = object["barcode"] as? String
        self.product = Product(product,brand: product["brand"] as! [String: Any] ,category: product["category"] as! [String: Any])
        self.thumbnailColor = object["thumbnail_color"] as? String
        self.thumbnailImage = object["thumbnail_image"] as? String
        self.translations = []
        self.webLink = object["web_link"] as? String
        self.config = Config(object["config"] as! [String:Any])
    }
}

// SkinAI v3 Events
struct Events {
    let onReady: ((Any) -> Void)?
    let onError: ((Any) -> Void)?
    let onPathChange: ((Any) -> Void)?
    let onOnboardingCarouselChange: ((Any) -> Void)?
    let onQuestionnaireComplete: ((Any) -> Void)?
    let onPhotoUse: ((Any) -> Void)?
    let onPhotoRetake: ((Any) -> Void)?
    let onSkinScoreCalculate: ((Any) -> Void)?
    let onExperienceChange: ((Any) -> Void)?
    let onRecommendationsReceive: ((Any) -> Void)?
    let onProductTryClick: ((Any) -> Void)?
    let onAISimulatorAdjust: ((Any) -> Void)?
    let onAddToCart: ((Any) -> Void)?
    let onProductVisit: ((Any) -> Void)?
    let onEmailButtonClick: ((Any) -> Void)?
    let onEmailSend: ((Any) -> Void)?
    let onCameraPermissionDeny: ((Any) -> Void)?
    let onProblemChipClick: ((Any) -> Void)?

    init(
        onReady: ((Any) -> Void)? = nil,
        onError: ((Any) -> Void)? = nil,
        onPathChange: ((Any) -> Void)? = nil,
        onOnboardingCarouselChange: ((Any) -> Void)? = nil,
        onQuestionnaireComplete: ((Any) -> Void)? = nil,
        onPhotoUse: ((Any) -> Void)? = nil,
        onPhotoRetake: ((Any) -> Void)? = nil,
        onSkinScoreCalculate: ((Any) -> Void)? = nil,
        onExperienceChange: ((Any) -> Void)? = nil,
        onRecommendationsReceive: ((Any) -> Void)? = nil,
        onProductTryClick: ((Any) -> Void)? = nil,
        onAISimulatorAdjust: ((Any) -> Void)? = nil,
        onAddToCart: ((Any) -> Void)? = nil,
        onProductVisit: ((Any) -> Void)? = nil,
        onEmailButtonClick: ((Any) -> Void)? = nil,
        onEmailSend: ((Any) -> Void)? = nil,
        onCameraPermissionDeny: ((Any) -> Void)? = nil,
        onProblemChipClick: ((Any) -> Void)? = nil
    ) {
        self.onReady = onReady
        self.onError = onError
        self.onPathChange = onPathChange
        self.onOnboardingCarouselChange = onOnboardingCarouselChange
        self.onQuestionnaireComplete = onQuestionnaireComplete
        self.onPhotoUse = onPhotoUse
        self.onPhotoRetake = onPhotoRetake
        self.onSkinScoreCalculate = onSkinScoreCalculate
        self.onExperienceChange = onExperienceChange
        self.onRecommendationsReceive = onRecommendationsReceive
        self.onProductTryClick = onProductTryClick
        self.onAISimulatorAdjust = onAISimulatorAdjust
        self.onAddToCart = onAddToCart
        self.onProductVisit = onProductVisit
        self.onEmailButtonClick = onEmailButtonClick
        self.onEmailSend = onEmailSend
        self.onCameraPermissionDeny = onCameraPermissionDeny
        self.onProblemChipClick = onProblemChipClick
    }
}

struct PulpoARProps {
    let plugin: String
    let slug: String
    let events: Events

    init(
        plugin: String,
        slug: String,
        events: Events
    ) {
        self.plugin = plugin
        self.slug = slug
        self.events = events
    }
}
