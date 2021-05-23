//
//  CWStringContants.swift
//  Cowin
//


import Foundation

enum CWStringConstant {
    
    
    enum onBoarding: String {
        case registerPrimary = "REGISTER YOURSELF"
        case locationPrimary = "CHOOSE VACCINE LOCATION"
        case confirmSlotPrimary = "CONFIRM YOUR SLOT"
        case faqPrimary = "ANY QUESTION?"
        
        case registerSecondary = "Register using your Mobile no. or Aadhaar no. or any other Identity docs."
        case locationSecondary = "Select your nearby Vaccine Center for vaccination"
        case confirmSlotSecondary = "Book your slot to Get Vaccine"
        case faqSecondary = "Please follow our Frequently asked question"
        
        case skip = "Skip"
        case getStart = "Get Started"
    }
    
    
    enum login: String {
        case primaryContent = "Register or SignIn for Vaccination"
        case secondaryContent = "An OTP will be sent to your mobile number for verification"
        case getOTP = "Get OTP"
        case done = "Done"
    }
    
    
    enum UserDefault: String {
        case authkey = "auth-tocken"
    }
}
