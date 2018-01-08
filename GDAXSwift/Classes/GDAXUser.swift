//
//  GDAXUser.swift
//  GDAXSwift
//
//  Created by Russ D'Sa on 1/7/18.
//

public struct GDAXUser: JSONInitializable {
    
    public let id: String
//    public let createdAt: Date
//    public let activeAt: Date
//    public let termsAcceptAt: Date
    public let name: String
    public let email: String
//    public let countryCode: String
    public let stateCode: String
    public let legalName: String
    
    internal init(json: Any) throws {
        var jsonData: Data?
        
        if let json = json as? Data {
            jsonData = json
        } else {
            jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        }
        
        guard let json = jsonData?.json else {
            throw GDAXError.invalidResponseData
        }
        
        guard let id = json["id"] as? String else {
            throw GDAXError.responseParsingFailure("id")
        }
        
        guard let name = json["name"] as? String else {
            throw GDAXError.responseParsingFailure("name")
        }
        
        guard let email = json["email"] as? String else {
            throw GDAXError.responseParsingFailure("email")
        }
        
        guard let legalName = json["legal_name"] as? String else {
            throw GDAXError.responseParsingFailure("legal_name")
        }
        
        guard let stateCode = json["state_code"] as? String else {
            throw GDAXError.responseParsingFailure("state_code")
        }
        
//        let country = json["country"] as? [String: String]
//        var countryCode: String?
//        if country != nil {
//            guard let countryCode = country!["code"] else {
//                throw GDAXError.responseParsingFailure("country code")
//            }
//        }
        
        self.id = id
        self.name = name
        self.email = email
        self.legalName = legalName
        self.stateCode = stateCode
//        self.countryCode =
        
//        guard let createdAt = json["created_at"] as? String else {
//            throw GDAXError.responseParsingFailure("created_at")
//        }
//
//        guard let activeAt = json["active_at"] as? String else {
//            throw GDAXError.responseParsingFailure("active_at")
//        }
//
//        guard let termsAcceptedAt = json["terms_accepted"] as? String else {
//            throw GDAXError.responseParsingFailure("terms_accepted")
//        }
    }
    
}
