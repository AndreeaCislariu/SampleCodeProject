//
//  Macros.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 06/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation


#if INDEBUG
	func dLog(message: String, filename: NSString = #file, function: String = #function, line: Int = #line) {
	NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(message)")
	}
	#else
	func dLog(message: String, filename: NSString = #file, function: String = #function, line: Int = #line) {
	}
#endif
func aLog(message: String, filename: String = #file, function: String = #function, line: Int = #line) {
	NSLog("[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
}