//
//  GDAX24HRStats.swift
//  GDAXSwift
//
//  Created by Anthony on 6/6/17.
//  Copyright © 2017 Anthony Puppo. All rights reserved.
//

public struct GDAXAccountHold: JSONInitializable, Codable {
	
	public let id: String
	public let accountID: String
	public let createdAt: Date
	public let updatedAt: Date
	public let amount: Double
	public let type: GDAXAccountHoldType
	public let ref: String
	
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
		
		guard let accountID = json["account_id"] as? String else {
			throw GDAXError.responseParsingFailure("account_id")
		}
		
		guard let createdAt = (json["created_at"] as? String)?.dateFromISO8601 else {
			throw GDAXError.responseParsingFailure("created_at")
		}
		
		guard let updatedAt = (json["updated_at"] as? String)?.dateFromISO8601 else {
			throw GDAXError.responseParsingFailure("updated_at")
		}
		
		guard let amount = Double(json["amount"] as? String ?? "") else {
			throw GDAXError.responseParsingFailure("amount")
		}
		
		guard let type = GDAXAccountHoldType(rawValue: json["type"] as? String ?? "") else {
			throw GDAXError.responseParsingFailure("type")
		}
		
		guard let ref = json["ref"] as? String else {
			throw GDAXError.responseParsingFailure("ref")
		}
		
		self.id = id
		self.accountID = accountID
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.amount = amount
		self.type = type
		self.ref = ref
	}
	
}
