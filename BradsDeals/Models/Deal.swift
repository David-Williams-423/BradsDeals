

import Foundation

// MARK: - Response
struct Response: Codable {
    let deals: [Deal]
    let count: Int
}

// MARK: - Deal
struct Deal: Codable {
    let alternateHeadline, alternateImageUrls: String?
    let bradsDealsExclusive: Bool
    let brands: [String]
    let categories: [Category]
    let coupons: [String]
    let couponCode, description, descriptionPreview, details: String
    let editor: String
    let editorBdUserID: String
    let excludeFromPds: Bool
    let expiresAt: String
    let flags: [Flag]
    let gender: Gender
    let generalSale: Bool
    let goLink: String
    let headline: String
    let id: Int
    let postUid: String?
    let image: String
    let imageUrls: ImageUrls
    let instructions: String
    let likeCount: Int
    let marketingDescription: String?
    let marketingHeadline: String?
    let marketingImageUrls: String?
    let merchandiseType: MerchandiseType
    let merchant: Merchant
    let msrp, price: String?
    let primaryCategory: Category
    let quote, ranking, relatedDealsURI: String
    let shippedPrice, shippingCost: String?
    let startsAt, teaserHeadline: String
    let thirdPartyPixel: ThirdPartyPixel?
    let uri: String

    enum CodingKeys: String, CodingKey {
        case alternateHeadline = "alternate_headline"
        case alternateImageUrls = "alternate_image_urls"
        case bradsDealsExclusive = "brads_deals_exclusive"
        case brands, categories, coupons
        case couponCode = "coupon_code"
        case description
        case descriptionPreview = "description_preview"
        case details, editor
        case editorBdUserID = "editor_bd_user_id"
        case excludeFromPds = "exclude_from_pds"
        case expiresAt = "expires_at"
        case flags, gender
        case generalSale = "general_sale"
        case goLink = "go_link"
        case headline, id
        case postUid = "post_uid"
        case image
        case imageUrls = "image_urls"
        case instructions
        case likeCount = "like_count"
        case marketingDescription = "marketing_description"
        case marketingHeadline = "marketing_headline"
        case marketingImageUrls = "marketing_image_urls"
        case merchandiseType = "merchandise_type"
        case merchant, msrp, price
        case primaryCategory = "primary_category"
        case quote, ranking
        case relatedDealsURI = "related_deals_uri"
        case shippedPrice = "shipped_price"
        case shippingCost = "shipping_cost"
        case startsAt = "starts_at"
        case teaserHeadline = "teaser_headline"
        case thirdPartyPixel = "third_party_pixel"
        case uri
    }
}

// MARK: - Category
struct Category: Codable {
    let uri, name, slug: String
}

// MARK: - Flag
struct Flag: Codable {
    let name: String
    let slug: Slug
    let id: Int
}

enum Slug: String, Codable {
    case allStarDealAssignedOnly = "all-star-deal-assigned-only"
    case appleCollection = "apple-collection"
    case axis = "axis"
    case dealOfTheDayAssignedOnly = "deal-of-the-day-assigned-only"
    case dealsUnder15 = "deals-under-15"
    case dealsUnder25 = "deals-under-25"
    case diversifiedContent = "diversified-content"
    case exclusiveCollection = "exclusive-collection"
    case fakespotVerified = "fakespot-verified"
    case freeShipping = "free-shipping"
    case giftsUnder50 = "gifts-under-50"
    case holidayApparelPjsHolidayClothesEtc = "holiday-apparel-pjs-holiday-clothes-etc"
    case holidayDecor = "holiday-decor"
    case householdEssentials = "household-essentials"
    case lastMinuteGiftsMustBeDeliveredInTimeForXmas = "last-minute-gifts-must-be-delivered-in-time-for-xmas"
    case patioFurniture = "patio-furniture"
    case perch = "perch"
    case primeFreeShipping = "prime-free-shipping"
    case proofreadByZach = "proofread-by-zach"
    case stockingStuffers = "stocking-stuffers"
    case thrasio = "thrasio"
    case todaysTrendingGifts = "todays-trending-gifts"
    case valentinesDayFeedPage = "valentines-day-feed-page"
}

enum Gender: String, Codable {
    case f = "f"
    case m = "m"
    case n = "n"
}

// MARK: - ImageUrls
struct ImageUrls: Codable {
    let the88X88, the160X160, the310X310, original: String

    enum CodingKeys: String, CodingKey {
        case the88X88 = "88x88"
        case the160X160 = "160x160"
        case the310X310 = "310x310"
        case original
    }
}

// MARK: - MerchandiseType
struct MerchandiseType: Codable {
    let id: Int
    let parentID: Int?
    let fullName, name, slug: String

    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parent_id"
        case fullName = "full_name"
        case name, slug
    }
}

// MARK: - Merchant
struct Merchant: Codable {
    let couponCount: Int
    let couponTypeCounts: CouponTypeCounts
    let dealCount, id: Int
    let logo: String
    let logoUrls: MerchantLogoUrls
    let merchantRules: MerchantRules
    let name: String
    let paymentTypes: [PaymentType]
    let siteURL, slug, uri: String

    enum CodingKeys: String, CodingKey {
        case couponCount = "coupon_count"
        case couponTypeCounts = "coupon_type_counts"
        case dealCount = "deal_count"
        case id, logo
        case logoUrls = "logo_urls"
        case merchantRules = "merchant_rules"
        case name
        case paymentTypes = "payment_types"
        case siteURL = "site_url"
        case slug, uri
    }
}

// MARK: - CouponTypeCounts
struct CouponTypeCounts: Codable {
    let online, onlineWithCodes, other, printable: Int
    let promotion: Int

    enum CodingKeys: String, CodingKey {
        case online
        case onlineWithCodes = "online_with_codes"
        case other, printable, promotion
    }
}

// MARK: - MerchantLogoUrls
struct MerchantLogoUrls: Codable {
    let the100X32, the125X40, the250X80, original: String

    enum CodingKeys: String, CodingKey {
        case the100X32 = "100x32"
        case the125X40 = "125x40"
        case the250X80 = "250x80"
        case original
    }
}

// MARK: - MerchantRules
struct MerchantRules: Codable {
    let disableSocialSharing, disableMobileView, hideExpirationDate: Bool
    let couponName: CouponName
    let advertisingDisclosure: Bool
    let dealGoLinkText: String?
    let seoValidation: Bool
    let alternateDisclaimer: AlternateDisclaimer?

    enum CodingKeys: String, CodingKey {
        case disableSocialSharing = "disable_social_sharing"
        case disableMobileView = "disable_mobile_view"
        case hideExpirationDate = "hide_expiration_date"
        case couponName = "coupon_name"
        case advertisingDisclosure = "advertising_disclosure"
        case dealGoLinkText = "deal_go_link_text"
        case seoValidation = "seo_validation"
        case alternateDisclaimer = "alternate_disclaimer"
    }
}

enum AlternateDisclaimer: String, Codable {
    case asAnAmazonAssociateWeEarnFromQualifyingPurchases = "As an Amazon Associate we earn from qualifying purchases."
    case empty = ""
}

enum CouponName: String, Codable {
    case coupon = "coupon"
    case promotion = "promotion"
}

// MARK: - PaymentType
struct PaymentType: Codable {
    let name: Name
    let logoUrls: PaymentTypeLogoUrls

    enum CodingKeys: String, CodingKey {
        case name
        case logoUrls = "logo_urls"
    }
}

// MARK: - PaymentTypeLogoUrls
struct PaymentTypeLogoUrls: Codable {
    let the128X128, the256X256, the512X512, original: String

    enum CodingKeys: String, CodingKey {
        case the128X128 = "128x128"
        case the256X256 = "256x256"
        case the512X512 = "512x512"
        case original
    }
}

enum Name: String, Codable {
    case applePay = "Apple Pay"
    case payPal = "PayPal"
}

enum ThirdPartyPixel: String, Codable {
    case empty = ""
    case thirdPartyPixel = " "
}
