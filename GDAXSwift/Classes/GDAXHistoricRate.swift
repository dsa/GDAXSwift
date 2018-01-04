//
//  GDAXHistoricRate.swift
//  GDAXSwift
//
//  Created by Anthony on 6/4/17.
//  Copyright © 2017 Anthony Puppo. All rights reserved.
//

public struct GDAXHistoricRate {
	
	public let time: Int
	public let low: Double
	public let high: Double
	public let open: Double
	public let close: Double
	public let volume: Double
	
	public init(time: Int, low: Double, high: Double, open: Double, close: Double, volume: Double) {
	    self.time = time
	    self.low = low
	    self.high = high
	    self.open = open
	    self.close = close
	    self.volume = volume
	}
}
