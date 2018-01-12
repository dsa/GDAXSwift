//
//  GDAXBid.swift
//  GDAXSwift
//
//  Created by Anthony on 6/4/17.
//  Copyright © 2017 Anthony Puppo. All rights reserved.
//

public struct GDAXBid: Codable {
	
	public let price: Double
	public let size: Double
	public let numOrders: Int?
	public let orderID: String?
	
}
