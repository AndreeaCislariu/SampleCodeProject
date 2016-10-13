//
//  Constants.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 06/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation

// Types of Treat Redemtion Methods
enum TreatRedemtionMethod:Int{
	case Offline
	case Online
}

// Types of Treats
enum TreatType:Int{
	case Daily = 0
	case LocalMarket
	case TreatShop
	case DiscountCodes
	case PurchasedTreat
}

// Keys types of Treats
enum TreatTypeKey:String{
	case Daily = "daily"
	case LocalMarket = "localmarket"
	case TreatShop = "treatshop"
	case DiscountCodes = "discountcodes"
}

// Types of Purchased keys
enum PurchasedTreatTypeKey:String{
	case Active = "active"
	case Expired = "expired"
}

// Types of Currencies
enum CurrencyValues:String{
	case USD = "USD"
	case EUR = "EUR"
	case GBP = "GBP"
}

// Menu default
enum MenuDefault:Int{
	case Profile = 100
	case Purchases = 101
}

// Distance types
enum DistanceType:Double{
	case Km = 1000
	case Miles = 1609.344
}

// Images ratios for thumbnails
enum LowResImageRatio:Float{
    case Width = 385.0
    case Height = 240.0
}

// Images ratios for full size
enum HighResImageRatio:Float{
    case Width = 770.0
    case Height = 480.0
}

// Type of payment
enum PaymentMethod:Int{
	case Stripe
	case PayPal
}

// Type of discount codes
enum TypeCode:String{
	case PromoCode = "promo_code"
	case TokenCode = "token_code"
}

// Keys
let stripePublishableKey = "pk_test_aPHZVzmzJN3qQ6qPAr9c3pMO"
let GATrackCode = "UA-59938868-1"


// Device version
let Device = UIDevice.currentDevice()
private let iosVersion = NSString(string: Device.systemVersion).doubleValue
let iOS8 = iosVersion >= 8
let iOS7 = iosVersion >= 7 && iosVersion < 8

// Defaults
let isInDebugStage = true // TODO: Change in production
let distanceType = DistanceType.Miles
let DefaultSharingLanguage = "en"


// API URL
let API_URL = "http://testing.treatticket.com/api/v2/"
#if Debug
	let API_URL = "http://testing.treatticket.com/api/v2/"
#endif

#if Testflight
	let API_URL = "http://testing.treatticket.com/api/v2/"
#endif

#if AppStore
	let API_URL = "https://www.treatticket.com/api/"
#endif

// Amazon Images Base URL
let Image_Base_URL = "https://s3-eu-west-1.amazonaws.com/treatticketstage/"

// UserDefaults Keys
let SelectedCity = "SelectedCity"
let LocationServiceAlertDisplayed = "LocationServiceAlertDisplayed"
let PushNotificationDictionary = "PushNotificationDictionary"


// COLORS
let AppBaseColor = UIColor(red: 158.0/255.0, green: 0, blue: 126.0/255.0, alpha: 1.0)
let BaseGrayColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)
let AppBaseGreenColor = UIColor(red: 131.0/255.0, green: 184.0/255.0, blue: 2.0/255.0, alpha: 0.9)
let AppBaseTextColor = UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)

// Navigation bar
let NavBarTextColor = UIColor.whiteColor()
let NavBarColor = AppBaseColor

// Loader
let Loader_BackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)
let Loader_ForegroundColor = AppBaseColor

// Home
let HomeBackgroundColor =  BaseGrayColor
let HomeHeaderTextColor = AppBaseGreenColor
let HomeHeaderViewAllTextColor = UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 1.0)
let HomeOddRowColor = UIColor.whiteColor()
let HomeEvenRowColor = UIColor.whiteColor()
let HomeTitleColor = AppBaseTextColor
let HomeProviderColor = UIColor.lightGrayColor()
let HomeInitialPriceColor = UIColor.lightGrayColor()
let HomeDiscountedPriceColor = AppBaseColor

// Treat view
let CustomTreatViewPriceViewColor = AppBaseGreenColor
let CustomTreatViewPriceColor = UIColor.whiteColor()
let CustomTreatViewCurrencyColor = UIColor.whiteColor()
let CustomTreatViewTitleColor = UIColor.whiteColor()
let CustomTreatViewDetailsColor = UIColor.whiteColor()
let CustomTreatViewDefaultPageDotColor = AppBaseColor
let CustomTreatViewSelectedPageDotColor = UIColor.whiteColor()

// City
let CityHeaderSectionTextColor = UIColor.darkGrayColor()
let CityRowTextColor = UIColor.darkGrayColor()
let CityHeaderViewColor = UIColor.lightGrayColor()
let CityTextIndexColor = AppBaseColor
let CityCurrentLocationTextColor = UIColor.blueColor()

// ListView
let ListViewBackgroundColor = BaseGrayColor
let ListViewTreatTitleTextColor = UIColor.blackColor()
let ListViewTreatDescriptionTextColor = UIColor.darkGrayColor()
let ListViewTreatNumberBoughtTextColor = UIColor.darkGrayColor()
let ListViewTreatPriceTextColor = AppBaseColor
let ListViewHeaderItemColor = AppBaseTextColor
let ListViewHeaderSelectedItemColor = AppBaseColor
let ListViewPullToRefreshBackgroundColor = AppBaseColor
let ListViewPullToRefreshTextColor = UIColor.whiteColor()

// SideMenu
let SideMenu_HeaderTextColor = UIColor.blackColor()
let SideMenu_ItemTextColor = UIColor.whiteColor()

let SideMenu_Section1Color = UIColor(red: 90.0/255.0, green: 0.0, blue: 71.0/255.0, alpha: 1.0)
let SideMenu_Section2Color = UIColor(red: 113.0/255.0, green: 0.0, blue: 90.0/255.0, alpha: 1.0)

// Location Header View
let LocationHeader_BackgroundColor = BaseGrayColor
let LocationHeader_LabelTextColor = UIColor.darkGrayColor()
let LocationHeader_LocationNameColor = AppBaseColor
let LocationHeader_ArrowBackgroundColor = BaseGrayColor
let LocationHeader_ArrowBorderColor = UIColor.lightGrayColor().CGColor

// Treat Details
let TreatDetails_BuyBarBackgroundColor = BaseGrayColor
let TreatDetails_BuyButtonColor = AppBaseColor
let TreatDetails_TreatTitleColor = UIColor.whiteColor()
let TreatDetails_TreatHeaderTitleColor = AppBaseGreenColor
let TreatDetails_TreatMapLocationColor = AppBaseTextColor
let TreatDetails_ProviderTitleColor = UIColor.whiteColor()
let TreatDetails_TreatSubtitleColor = AppBaseTextColor
let TreatDetails_PriceTextColor = AppBaseColor
let TreatDetails_BoughtTextColor = UIColor.darkGrayColor()
let TreatDetails_BoughtValueTextColor = UIColor.lightGrayColor()
let TreatDetails_ObservationTextColor = UIColor(red: 255.0/255.0, green: 85.0/255.0, blue: 24.0/255.0, alpha: 1.0)
let TreatDetails_HeaderViewBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
let TreatDetails_PriceHeaderSideColor = UIColor(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0)
let TreatDetails_PriceHeaderCenterColor = AppBaseGreenColor
let TreatDetails_FullPriceTextColor = UIColor(red: 75.0/255.0, green: 75.0/255.0, blue: 75.0/255.0, alpha: 1.0)
let TreatDetails_TreatPriceTextColor = UIColor.whiteColor()

// Treat Options
let TreatOptions_TitleColor = AppBaseTextColor
let TreatOptions_ExpiresColor = UIColor.lightGrayColor()
let TreatOptions_ExpiresValueColor = UIColor.darkGrayColor()
let TreatOptions_PriceColor = AppBaseGreenColor
let TreatOptions_DateColor = AppBaseGreenColor
let TreatOptions_DashedLineColor = UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 1.0)

// Treat Checkout
let TreatCheckout_AddPaymentMethodBackgroundColor = UIColor.blackColor()
let TreatCheckout_AddPaymentButtonColor = AppBaseColor
let TreatCheckout_RightSideLabelColor = UIColor.darkGrayColor()
let TreatCheckout_LeftSideLabelColor = UIColor.lightGrayColor()
let TreatCheckout_TotalCellBackgroundColor = UIColor.darkGrayColor()
let TreatCheckout_SubtotalCellBackgroundColor = UIColor.lightGrayColor()
let TreatCheckout_NormalCellBackgroundColor = UIColor.whiteColor()

// Purchased Treat
let PurchasedTreatDetails_TreatHeaderTitleColor = UIColor.blackColor()
let PurchasedTreatDetails_PassbookButtonColor = AppBaseColor
let PurchasedTreatDetails_PassbookButtonTextColor = UIColor.whiteColor()
let PurchasedTreatDetails_PDFButtonColor = AppBaseColor
let PurchasedTreatDetails_PDFButtonTextColor = UIColor.whiteColor()
let PurchasedTreatDetails_SendAsGiftButtonTextColor = AppBaseColor

// Send As Gift
let SendAsGift_HeaderLabelColor = UIColor.blackColor()
let SendAsGift_TextFieldTextColor = UIColor.blackColor()
let SendAsGift_ButtonTextColor = UIColor.whiteColor()
let SendAsGift_ButtonBackgroundColor = AppBaseColor
let SendAsGift_LabelTextColor = UIColor.blackColor()
let SendAsGift_TextViewBackgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 1.0)

// Welcome
let Welcome_BackgroundColor = AppBaseColor
let Welcome_WelcomeTextColor = UIColor(red: 229/255.0, green: 178.0/255.0, blue: 217.0/255.0, alpha: 1.0)
let Welcome_AppTitleTextColor = UIColor.whiteColor()
let Welcome_OptionLabelTextColor = UIColor.whiteColor()
let Welcome_OptionLabelBackgroundColor = UIColor(red: 133.0/255.0, green: 0.0/255.0, blue: 106.0/255.0, alpha: 1.0)
let Welcome_LoginButtonTextColor = UIColor.whiteColor()
let Welcome_LoginButtonBackgroundColor = UIColor(red: 131.0/255.0, green: 184.0/255.0, blue: 2.0/255.0, alpha: 1.0)
let Welcome_SignUpButtonTextColor = UIColor(red: 239.0/255.0, green: 218.0/255.0, blue: 247.0/255.0, alpha: 1.0)

// Login
let Login_BackgroundColor = AppBaseColor
let Login_PleaseLabelColor = UIColor.whiteColor()
let Login_LoginLabelColor = UIColor.whiteColor()
let Login_UsernameLabelColor = UIColor.whiteColor()
let Login_PasswordLabelColor = UIColor.whiteColor()
let Login_LoginButtonBackgroundColor = UIColor(red: 131.0/255.0, green: 184.0/255.0, blue: 2.0/255.0, alpha: 1.0)
let Login_LoginButtonLabelColor = UIColor.whiteColor()
let Login_ForgotPasswordButtonLabelColor = UIColor.whiteColor()
let Login_ForgotPasswordButtonBackgroundColor = UIColor.clearColor()


let Login_DontHaveAnAccountLabelColor = UIColor.darkGrayColor()
let Login_SignUpNowButtonBackgroundColor = UIColor.clearColor()
let Login_SignUpNowButtonLabelColor = AppBaseColor
let Login_HeaderTextColor = UIColor.darkGrayColor()

// Register
let Register_BackgroundColor = UIColor.whiteColor()
let Register_FirstNameTextColor = UIColor.blackColor()
let Register_FirstNameTextFieldBackgroundColor = BaseGrayColor
let Register_SurnameLabelTextColor = UIColor.blackColor()
let Register_SurnameTextFieldBackgroundColor = BaseGrayColor
let Register_DateOfBirthLabelTextColor = UIColor.blackColor()
let Register_DayOfBirthTextFieldBackgroundColor = BaseGrayColor
let Register_MonthOfBirthTextFieldBackgroundColor = BaseGrayColor
let Register_YearOfBirthTextFieldBackgroundColor = BaseGrayColor
let Register_GenderLabelTextColor = UIColor.blackColor()
let Register_GenderTextFieldBackgroundColor = BaseGrayColor
let Register_RegisterButtonTextColor = UIColor.whiteColor()
let Register_RegisterButtonBackgroundColor = UIColor(red: 131.0/255.0, green: 184.0/255.0, blue: 2.0/255.0, alpha: 1.0)

// TODO DELETE THIS BLOCK
let Register_HeaderTextColor = UIColor.darkGrayColor()
let Register_SignUpButtonBackgroundColor = AppBaseColor
let Register_SignUpButtonLabelColor = UIColor.whiteColor()

// Profile
let Profile_BackgroundColor = BaseGrayColor
let Profile_HeaderTextColor = UIColor.darkGrayColor()
let Profile_UpdateProfileButtonBackgroundColor = AppBaseColor
let Profile_UpdateProfileButtonLabelColor = UIColor.whiteColor()
let Profile_LogoutButtonLabelColor = UIColor.whiteColor()
let Profile_LogoutButtonBackgroundColor = AppBaseColor

// Redeem Popup
let RedeemPopup_ViewBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
let RedeemPopup_BackgroundColor = UIColor.whiteColor()
let RedeemPopup_CodeLabelColor = AppBaseColor
let RedeemPopup_ButtonColor = AppBaseColor
let RedeemPopup_CloseButtonColor = BaseGrayColor

// Forgot Password Popup
let ForgotPassword_BackgroundColor = AppBaseColor
let ForgotPassword_RecoverLabelTextColor = UIColor.whiteColor()
let ForgotPassword_PasswordLabelTextColor = UIColor.whiteColor()
let ForgotPassword_EmailAddressLabelTextColor = UIColor.whiteColor()
let ForgotPassword_SubmitButtonTextColor = UIColor.whiteColor()
let ForgotPassword_SubmitButtonBackgroundColor = UIColor(red: 131.0/255.0, green: 184.0/255.0, blue: 2.0/255.0, alpha: 1.0)

// TODO Delete this block
let ForgotPassword_ViewBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
let ForgotPassword_CodeLabelColor = AppBaseColor
let ForgotPassword_ButtonColor = AppBaseColor
let ForgotPassword_ButtonTextColor = UIColor.whiteColor()
let ForgotPassword_CloseButtonColor = BaseGrayColor

// Map
let MapAnnotation_TitleColor = UIColor.whiteColor()
let MapAnnotation_PriceColor = UIColor.whiteColor()


// FONTS
let NavBarTextFont = UIFont.systemFontOfSize(18)

// Home
let HomeHeaderTextFont = UIFont.systemFontOfSize(16)
let HomeHeaderViewAllTextFont = UIFont.systemFontOfSize(12)
let HomeTitleTextFont = UIFont.systemFontOfSize(16)
let HomeProviderTextFont = UIFont.systemFontOfSize(14)
let HomeInitialPriceTextFont = UIFont.systemFontOfSize(14)
let HomeDiscountedPriceTextFont = UIFont.boldSystemFontOfSize(16)

// Treat view
let CustomTreatViewPriceTextFont = UIFont.boldSystemFontOfSize(20)
let CustomTreatViewCurrencyTextFont = UIFont.systemFontOfSize(14)
let CustomTreatViewTitleTextFont = UIFont.boldSystemFontOfSize(20)
let CustomTreatViewDetailsTextFont = UIFont.systemFontOfSize(16)

// City
let CityHeaderSectionTextFont = UIFont.systemFontOfSize(18)
let CityRowTextFont = UIFont.systemFontOfSize(18)
let CityLocationRowTextFont = CityRowTextFont

// ListView
let ListViewTreatTitleFont = UIFont.systemFontOfSize(18)
let ListViewTreatDescriptionFont  = UIFont.systemFontOfSize(14)
let ListViewTreatNumberBoughtFont = UIFont.systemFontOfSize(14)
let ListViewTreatPriceFont = UIFont.systemFontOfSize(16)
let ListViewPullToRefreshTextFont = UIFont.systemFontOfSize(16)
let ListViewHeaderItemFont = UIFont.systemFontOfSize(14)

// SideMenu
let SideMenu_HeaderTextFont = UIFont.systemFontOfSize(16)
let SideMenu_ItemTextFont = UIFont.systemFontOfSize(14)

// Location Header View
let LocationHeader_LabelFont = UIFont.systemFontOfSize(14)
let LocationHeader_SelectedLocationFont = UIFont.systemFontOfSize(14)

// Treat Details
let TreatDetails_BuyButtonFont = UIFont.systemFontOfSize(14)
let TreatDetails_TreatTitleFont = UIFont.systemFontOfSize(16)
let TreatDetails_TreatHeaderTitleFont = UIFont.systemFontOfSize(16)
let TreatDetails_TreatMapLocationFont = UIFont.systemFontOfSize(14)
let TreatDetails_TreatProviderFont = UIFont.boldSystemFontOfSize(16)
let TreatDetails_TreatSubtitleFont = UIFont.systemFontOfSize(12)
let TreatDetails_PriceTextFont = UIFont.systemFontOfSize(20)
let TreatDetails_BoughtTextFont = UIFont.systemFontOfSize(12)
let TreatDetails_BoughtValueTextFont = UIFont.systemFontOfSize(12)
let TreatDetails_ObservationTextFont = UIFont.systemFontOfSize(12)
let TreatDetails_FullPriceTextFont = UIFont.systemFontOfSize(12)
let TreatDetails_FullPriceValueTextFont = UIFont.boldSystemFontOfSize(20)
let TreatDetails_TreatPriceTextFont = UIFont.systemFontOfSize(12)
let TreatDetails_TreatPriceValueTextFont = UIFont.boldSystemFontOfSize(20)
let TreatDetails_DiscountTextFont = UIFont.systemFontOfSize(12)
let TreatDetails_DiscountValueTextFont = UIFont.boldSystemFontOfSize(20)

// Treat Options
let TreatOptions_TitleFont = UIFont.systemFontOfSize(14)
let TreatOptions_ExpiresFont = UIFont.systemFontOfSize(12)
let TreatOptions_ExpiresValueFont = UIFont.systemFontOfSize(12)
let TreatOptions_PriceFont = UIFont.systemFontOfSize(16)
let TreatOptions_DateFont = UIFont.systemFontOfSize(12)

// Treat Checkout
let TreatCheckout_AddPaymentButtonFont = UIFont.systemFontOfSize(14)

// Purchased Treat Details
let PurchasedTreatDetails_TreatHeaderTitleFont = UIFont.systemFontOfSize(16)

// Send As Gift
let SendAsGift_HeaderLabelFont = UIFont.systemFontOfSize(16)
let SendAsGift_TextFieldFont = UIFont.systemFontOfSize(14)
let SendAsGift_ButtonTextFont = UIFont.systemFontOfSize(14)
let SendAsGift_LabelFont = UIFont.systemFontOfSize(14)

// Welcome
let Welcome_WelcomeTextFont = UIFont.systemFontOfSize(16)
let Welcome_AppTitleTextFont = UIFont.systemFontOfSize(30)
let Welcome_OptionLabelTextFont = UIFont.systemFontOfSize(20)
let Welcome_LoginButtonTextFont = UIFont.systemFontOfSize(16)
let Welcome_SignUpButtonTextFont = UIFont.systemFontOfSize(14)

// Login
let Login_HeaderTextFont = UIFont.systemFontOfSize(16)
let Login_EmailTextFont = UIFont.systemFontOfSize(14)
let Login_SignInButtonTextFont = UIFont.systemFontOfSize(14)
let Login_NoAccountTextFont = UIFont.systemFontOfSize(12)
let Login_SignUpTextFont = UIFont.boldSystemFontOfSize(16)

let Login_PleaseTextFont = UIFont.systemFontOfSize(16)
let Login_LoginTextFont = UIFont.systemFontOfSize(30)
let Login_UsernameTextFont = UIFont.systemFontOfSize(12)
let Login_PasswordTextFont = UIFont.systemFontOfSize(12)
let Login_LoginButtonTextFont = UIFont.systemFontOfSize(16)
let Login_ForgotPasswordTextFont = UIFont.boldSystemFontOfSize(12)

// Register
let Register_FirstNameTextFont = UIFont.systemFontOfSize(14)
let Register_SurnameLabelTextFont = UIFont.systemFontOfSize(14)
let Register_DateOfBirthTextFont = UIFont.systemFontOfSize(14)
let Register_GenderLabelTextFont = UIFont.systemFontOfSize(14)
let Register_registerButtonTextFont = UIFont.systemFontOfSize(18)

// TODO DELETE THIS BLOCK
let Register_HeaderTextFont = UIFont.systemFontOfSize(16)
let Register_TextFieldFont = UIFont.systemFontOfSize(14)
let Register_ButtonTextFont = UIFont.systemFontOfSize(16)


// Profile
let Profile_HeaderTextFont = UIFont.systemFontOfSize(16)
let Profile_TextFieldFont = UIFont.systemFontOfSize(14)
let Profile_ButtonTextFont = UIFont.systemFontOfSize(16)

// Redeem Popup
let RedeemPopup_CodeLabelFont = UIFont.systemFontOfSize(16)
let RedeemPopup_ButtonFont = UIFont.boldSystemFontOfSize(18)

// ForgotPassword
let ForgotPassword_RecoverLabelFont = UIFont.systemFontOfSize(16)
let ForgotPassword_PasswordLabelFont = UIFont.systemFontOfSize(30)
let ForgotPassword_EmailAddressLabelFont = UIFont.boldSystemFontOfSize(12)
let ForgotPassword_SubmitButtonFont = UIFont.boldSystemFontOfSize(16)


// ForgotPassword Popup
let ForgotPassword_CodeLabelFont = UIFont.systemFontOfSize(16)
let ForgotPassword_ButtonFont = UIFont.boldSystemFontOfSize(18)

// Map
let MapAnnotation_TitleFont = UIFont.systemFontOfSize(14)
let MapAnnotation_PriceFont = UIFont.systemFontOfSize(14)

// Metrics
let HomeTreatsLeftSpace:CGFloat = 14
let HomeItemSizeSmall:CGFloat = 295
let HomeItemSizeBig:CGFloat = 295
let HomeCornerRadius:CGFloat = 0
let HomeCornerShadowRadius:CGFloat = 0
let HomeShadowOpacity:Float = 0
let HomeHeaderHeight:CGFloat = 216
let HomeHeaderAutoScrollTimeInterval:Double = 5
let HomeHeaderAnimationDuration:Double = 1

// ListView
let ListView_CellHeight:CGFloat = 253
let ListView_CellImageHeight:CGFloat = 158
let ListView_CellSpacing:CGFloat = 10

// Side Menu
let SideMenuSection1HeaderHeight:CGFloat = 70
let SideMenuSection2HeaderHeight:CGFloat = 20
let SideMenuRowHeight:CGFloat = 40
let SideMenuSection1FooterHeight:CGFloat = 20

// City
let CityHeaderHeight:CGFloat = 40.0
let CityRowHeight:CGFloat = 70
let CityCurrentLocationRowHeight:CGFloat = 60

// Header view
let HeaderView_ArrowCornerRadius:CGFloat = 3
let HeaderView_ArrowBorderWidth:CGFloat = 1

// Treat Details
let TreatDetails_HeaderHeight:CGFloat = 216
let TreatDetails_MapCellMinHeight:CGFloat = 400
let TreatDetails_DetailsCellMinHeight:CGFloat = 200
let TreatDetails_MapAnnotationWidth:CGFloat = 65
let TreatDetails_MapAnnotationHeight:CGFloat = 75

// Purchased Treat
let PurchasedTreatDetails_DetailsCellMinHeight:CGFloat = 118

// General
let Buttons_CornerRadius:CGFloat = 3
let ViewsItemsPadding:CGFloat = 20

// Loader
let Loader_Tickness:CGFloat = 5

// Redeem Popup
let RedeemPopup_CornerRadius:CGFloat = 5

// Forgot Password Popup
let ForgotPassword_CornerRadius:CGFloat = 5

// Default settings
let LocationUpdateSeconds = 300.0
let DefaultCityID = "1"

// Categories Order
let AllCategoriesIndex = 1
let NearmeCategoriesIndex = 0
let ProviderAllCategoriesIndex = 0

// Show forgot pass counter
let ForgotPasswordCounter = 3

// Notifications
let PushToTreatDetailsNotification = "PushToTreatDetailsNotification"
let PushToProviderTreatDetailsNotification = "PushToProviderTreatDetailsNotification"
let PushToPurchasedTreatDetailsNotification = "PushToPurchasedTreatDetailsNotification"
let LocationSelectionChanged = "LocationSelectionChanged"
let UpdateTopBarCategoryIndex = "UpdateTopBarCategoryIndex"
let UpdateCategoryBarScrollPosition = "UpdateCategoryBarScrollPosition"
let UpdateListCategoryScrollPosition = "UpdateListCategoryScrollPosition"

let ShowBackButtonNotification = "ShowBackButtonNotification"
let HideBackButtonNotification = "HideBackButtonNotification"
let ShowNavBarTitleNotification = "ShowNavBarTitleNotification"
let ShowCitiesListView = "ShowCitiesListView"
let	HideCitiesListView = "HideCitiesListView"
let ReloadHomeList = "ReloadHomeList"
let LoadHomeData = "LoadHomeData"
let StartLocationUpdate = "StartLocationUpdate"
let GlobalsListUpdateData = "GlobalsListUpdateData"
let ScrollToCategory = "ScrollToCategory"
let NavigateToTreatFromPush = "NavigateToTreatFromPush"
let UpdateCheckoutTotalNotification = "UpdateCheckoutTotalNotification"
let UpdateProfileTabNotification = "UpdateProfileTabNotification"

// Notification Keys
let PercentageOffset = "PercentageOffset"
let BackButton = "BackButton"
let NavBarTitle = "NavBarTitle"
let TreatObject = "TreatObject"
let PageNumber = "PageNumber"

// Dictionary Keys
let Categories_All = "All"
let Categories_Nearme = "Nearme"

// GA tracking strings
let GA_HomeScreen = "Home"
let GA_CheckoutScreen = "Checkout"
let GA_CreditsScreen = "Credits"
let GA_CheckoutDiscountCodeScreen = "DiscountCode"
let GA_ForgotPasswordScreen = "ForgotPassword"
let GA_LoginScreen = "Login"
let GA_PaymentScreen = "Payment"
let GA_PayPalScreen = "PayPal"
let GA_ProfileScreen = "Profile"
let GA_ProviderTreatScreen = "ProviderTreatDetails"
let GA_PurchasesScreen = "Purchases"
let GA_RedeemPopupScreen = "RedeemPopup"
let GA_RegisterScreen = "Register"
let GA_SideMenuScreen = "SideMenu"
let GA_TreatDetailsScreen = "TreatDetails"
let GA_PurchasedTreatDetailsScreen = "PurchasedTreatDetails"
let GA_PurchasedTreatVoucherPDFScreen = "PurchasedTreatVoucherPDFScreen"
let GA_PurchasedTreatVoucherSendAsGiftScreen = "PurchasedTreatVoucherSendAsGiftScreen"
let GA_PurchasedTreatVoucherPassScreen = "PurchasedTreatVoucherPassScreen"

// API Calls
let API_Login = "signin"
let API_FBLogin = "fbsignin"
let API_Home = "globals/home"
let API_Globals = "globals/"
let API_GlobalsLists = "globals/lists"
let API_Deals = "deals"
let API_ProviderTreats = "provider-treats"
let API_RegisterPush = "devices"
let API_ForgotPass = "remind"
let API_Signup = "shoppers"
let API_Credits = "shoppers/credits"
let API_Discounts = "discounts"
let API_TotalPayment = "purchases/calculate-payment-values"
let API_StripePayment = "purchases/pay-with-stripe"
let API_PayPalPayment = "purchases/pay-with-paypal"
let API_UpdateProfile = "/update"
let API_TestHash = "shoppers/hashtest"
let API_Purchases = "shoppers/purchases"
let API_VoucherPassbook = "vouchers/passbook"
let API_VoucherPDF = "vouchers/pdf"
let API_SendAsGift = "vouchers/send-as-gift"


// API Parameters
let APIParam_Daily = "daily"
let APIParam_Provider = "provider"
let APIParam_DiscountCodes = "discountcodes"
let APIParam_LocalMarket = "localmarket"
let APIParam_TreatShop = "treatshop"
let APIParam_Username = "username"
let APIParam_Password = "password"
let APIParam_CityID = "city_id"
let APIParam_GlobalsCityID = "id"
let APIParam_CityName = "city_name"
let APIParam_Latitude = "lat"
let APIParam_Longitude = "lng"
let APIParam_Id = "id"
let APIParam_TreatId = "treat_id"
let APIParam_CreatedAt = "created_at"
let APIParam_Name = "name"
let APIParam_Description = "description"
let APIParam_Summary = "summary"
let APIParam_Title = "title"
let APIParam_TitleApp = "title_app"
let APIParam_ImageURL = "image_url"
let APIParam_Images = "images"
let APIParam_ImageFilename = "filename"
let APIParam_ImageSquare = "filename_square"
let APIParam_ProviderImage = "provider_image"
let APIParam_Variations = "variations"
let APIParam_TreatVariation = "treat_variation"
let APIParam_OriginalPrice = "original_price"
let APIParam_DiscountedPrice = "discounted_price"
let APIParam_CategoryID = "sector_id"
let APIParam_Options = "options"
let APIParam_PAndPPrice = "p_and_p"
let APIParam_Status = "status"
let APIParam_TreatProvider = "provider"
let APIParam_ProviderName = "provider_name"
let APIParam_ProviderDescription = "provider_description"
let APIParam_ProviderMapURL = "provider_map_url"
let APIParam_AvailableUntil = "valid_to_date"
let APIParam_AvailableFrom = "available_to"
let APIParam_NumberBought = "number_bought"
let APIParam_Price = "price"
let APIParam_Terms = "terms"
let APIParam_RedemtionMethod = "redemption_type"
let APIParam_Online = "online"
let APIParam_Offline = "offline"
let APIParam_Type = "type"
let APIParam_PublicKey = "public_key"
let APIParam_PrivateKey = "private_key"
let APIParam_Email = "email"
let APIParam_SalutationID = "salutation_id"
let APIParam_Forename = "forename"
let APIParam_Surname = "surname"
let APIParam_Address1 = "address1"
let APIParam_Address2 = "address2"
let APIParam_Country = "country"
let APIParam_PostCode = "postcode"
let APIParam_Town = "town"
let APIParam_County = "county"
let APIParam_PhoneNumber = "phonenumber"
let APIParam_DOB = "dob"
let APIParam_Gender = "gender"
let APIParam_AvailableCredits = "available_credits"
let APIParam_Countries = "countries"
let APIParam_Cities = "cities"
let APIParam_Salutations = "salutations"
let APIParam_Sectors = "sectors"
let APIParam_ImageBaseURL = "image_base_url"
let APIParam_PurchaseLimit = "purchase_limit"
let APIParam_PurchaseCount = "purchase_count"
let APIParam_CommissionPercent = "commission_percent"
let APIParam_ContactAddress1 = "contact_address1"
let APIParam_ContactAddress2 = "contact_address2"
let APIParam_ContactTown = "contact_town"
let APIParam_ContactPostCode = "contact_postcode"
let APIParam_ContactPhone = "contact_phone"
let APIParam_Sequence = "sequence"
let APIParam_Distance = "distance"
let APIParam_ProviderID = "provider_id"
let APIParam_NumAvailable = "num_available"
let APIParam_Featured = "featured"
let APIParam_Currency = "currency"
let APIParam_Nearme = "nearme"
let APIParam_AffiliateWindow = "affiliate_window_deal"
let APIParam_DiscountCode = "discount_code"
let APIParam_URL = "url"
let APIParam_DeviceType = "device_type"
let APIParam_TotalValue = "txn_total_value"
let APIParam_DiscountValue = "token_discount_value"
let APIParam_PromoDiscountValue = "promo_discount_value"
let APIParam_CreditValue = "credit_value"
let APIParam_PaymentValue = "txn_payment_value"
let APIParam_Credits = "credits"
let APIParam_DiscountPercentage = "discount_percentage"
let APIParam_TotalDiscountValue = "discount"
let APIParam_TotalCreditsValue = "credits"
let APIParam_Subtotal = "subtotal"
let APIParam_Total = "total"
let APIParam_MinimumSpent = "minimum_spend"
let APIParam_RedirectURL = "redirect"
let APIParam_Sharing = "sharing"
let APIParam_SharingFacebook = "facebook"
let APIParam_SharingTwitter = "twitter"
let APIParam_Quantity = "quantity"
let APIParam_CreditsValue = "credit_value"
let APIParam_PromoDiscount = "promo_discount_value"
let APIParam_TokenDiscount = "token_discount_value"
let APIParam_TreatTotalValue = "txn_total_value"
let APIParam_TotalPaymentValue = "txn_payment_value"
let APIParam_PurchaseTreat = "treat"
let APIParam_VoucherCode = "voucher_code"
let APIParam_VoucherID = "voucher_id"
let APIParam_PurchaseID = "purchase_id"
let APIParam_Courier = "courier"
let APIParam_RedeemCode = "redeem_code"
let APIParam_TrackingCode = "tracking_code"
let APIParam_Valid = "valid"
let APIParam_Vouchers = "vouchers"
let APIParam_SharingURLs = "sharing_urls"


// API POST Parameters
let APIPostParam_CityID = "city_id"
let APIPostParam_Latitude = "latitude"
let APIPostParam_Longitude = "longitude"
let APIPostParam_NewDeviceToken = "new_device_token"
let APIPostParam_DeviceToken = "device_token"
let APIPostParam_Method = "_method"
let APIPostParam_MethodPut = "PUT"
let APIPostParam_Type = "aps"
let APIPostParam_SourceAps = "aps"
let APIPostParam_Source = "source"
let APIPostParam_Email = "email"
let APIPostParam_Password = "password"

let APIPostParam_FBUserID = "facebook_uid"
let APIPostParam_Forename = "forename"
let APIPostParam_Surname = "surname"
let APIPostParam_Gender = "gender"
let APIPostParam_Address1 = "address1"
let APIPostParam_Address2 = "address2"
let APIPostParam_Town = "town"
let APIPostParam_County = "county"
let APIPostParam_Country = "country"
let APIPostParam_PostCode = "postcode"
let APIPostParam_Phonenumber = "phonenumber"
let APIPostParam_DOB = "dob"

let APIPostParam_SalutationID = "salutation_id"
let APIPostParam_CityNotifications = "city_notifications"
let APIPostParam_LiveCityNotifications = "live_city_notifications"

let APIPostParam_PubKey = "pub_key"
let APIPostParam_DiscountCode = "code"
let APIPostParam_Quantity = "quantity"
let APIPostParam_TreatVariationID = "treat_variation_id"
let APIPostParam_CreditValue = "credit_value"
let APIPostParam_TokenCode = "token_code"
let APIPostParam_PromoCode = "promo_code"
let APIPostParam_StripeToken = "stripeToken"
let APIPostParam_TokenID = "treat_id"
let APIPostParam_Hash = "hash"
let APIPostParam_Timestamp = "timestamp"
let APIPostParam_FriendEmail = "friend_email"
let APIPostParam_FriendName = "friend_name"
let APIPostParam_Message = "message"

// App parameters
let AppParam_CityID = "id"
let AppParam_CityName = "name"
let AppParam_CurrentUser = "CurrentUser"
let AppParam_UserID = "UserID"
let AppParam_UserName = "UserName"
let AppParam_CurrentCityID = "CityID"
let AppParam_CurrentCityName = "CityName"
let AppParam_Latitude = "Latitude"
let AppParam_Longitude = "Longitude"
let AppParam_DeviceToken = "DeviceToken"
let AppParam_NewDeviceToken = "NewDeviceToken"
let AppParam_DeviceTokenRegistered = "DeviceTokenRegistered"
let AppParam_Shopper = "Shopper"
let AppParam_LoggedInWithFB = "AppParam_LoggedInWithFB"
let AppParam_ID = "id"
let AppParam_PublicKey = "public_key"
let AppParam_PrivateKey = "private_key"
let AppParam_Email = "email"
let AppParam_TownID = "cityID"
let AppParam_SalutationID = "salutationID"
let AppParam_Address1 = "address1"
let AppParam_Address2 = "address2"
let AppParam_Town = "town"
let AppParam_County = "county"
let AppParam_Forename = "forename"
let AppParam_Surname = "surname"
let AppParam_PostCode = "postCode"
let AppParam_Country = "country"
let AppParam_PhoneNumber = "phoneNumber"
let AppParam_DOB = "dob"
let AppParam_Gender = "gender"
let AppParam_AvailableCredits = "availableCredits"
let AppParam_PaymentCancelled = "payment_cancelled"
let AppParam_PaymentError = "payment_error"
let AppParam_PaymentSuccess = "payment_success"


// API push notification settings parameters
let APIPushParam_Treat = "treat"
let APIPushParam_Daily = "daily"
let APIPushParam_Provider = "provider"




