//
//  base58.swift
//  Cardano Lib - iOS Test
//
//  Created by HM on 21/10/2018.
//  Copyright © 2018 Lambo Corp. All rights reserved.
//

import Foundation

class CardanoFuncs {
    static func encode(stringToEncode: String) -> String {

        let byteArrayToEncode: [UInt8] = Array(stringToEncode.utf8)
        
        let encoded = UnsafeMutableRawPointer.allocate(bytes: 1000, alignedTo: MemoryLayout<UInt8>.alignment)
        let opaquePtr = OpaquePointer(encoded)
        let contextPtr = UnsafeMutablePointer<Int8>(opaquePtr)
        
        let status = my_b58_encode(byteArrayToEncode,UInt32(byteArrayToEncode.count), contextPtr)
        
        var encodedString = "*** ERROR ***"
        
        if status >= 0 {
            encodedString = String(cString: contextPtr)
        }
        
        encoded.deallocate(bytes: 1000, alignedTo: MemoryLayout<UInt8>.alignment)
        
        return encodedString
    }
    
    static func decode(stringToDecode: String) -> String {
        
        let raw = UnsafeMutableRawPointer.allocate(bytes: 1000, alignedTo: MemoryLayout<UInt8>.alignment)
        let typedPtr = raw.initializeMemory(as: UInt8.self, at: 0, count: 1000, to: 0)
        
        let cstr = stringToDecode.cString(using: String.Encoding.utf8)
        
        let status = my_b58_decode(cstr, typedPtr)
        
        var decodedString = "*** ERROR ***"
        
        if status >= 0 {
            decodedString = String(cString: typedPtr)
        }
        
        raw.deallocate(bytes: 1000, alignedTo: MemoryLayout<UInt8>.alignment)
        
        return decodedString
    }
}
