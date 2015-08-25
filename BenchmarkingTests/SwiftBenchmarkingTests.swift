//
//  BenchmarkingTests.swift
//  BenchmarkingTests
//
//  Created by Maximilian Clarke on 23/08/2015.
//  Copyright (c) 2015 Maximilian Clarke. All rights reserved.
//

import UIKit
import XCTest

class BenchmarkingTests: XCTestCase {
    
    let nsDict = NSDictionary(
        object: NSDictionary(
            object: NSDictionary(
                object: NSDictionary(
                    object: "Die Harder.",
                    forKey: "TagLine"),
                forKey: "Die Hard 2"),
            forKey: "Movies"),
        forKey: "MediaTypes"
    )
    
    let swDict: MoviesDictionary = ["MediaTypes": ["Movies": ["Die Hard 2": ["TagLine": "Die Harder."]]]]
    
    let dictionaryFetcher: DictionaryFetcher = DictionaryFetcher()
    
    
    // MARK: Nested test
    
    func testNestedDictionaryFetchPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                // Set the basline: run test with this fetch method first and set the result as the baseline
                self.dictionaryFetcher.fetchFromNSDictionaryWithoutAnyBridgingInIfLetChain(self.nsDict)
                
                // Then comment out the baseline and comment these in one by one to compare
//                self.dictionaryFetcher.fetchFromNSDictionaryByCastingToSwiftDictInIfLetChain(self.nsDict)
//                self.dictionaryFetcher.fetchFromSwiftDictionaryWithoutAnyCastingInIfLetChain(self.swDict)
//                self.dictionaryFetcher.fetchFromNSDictionaryByOptionalChain(self.nsDict)
//                self.dictionaryFetcher.fetchFromSwiftDictionaryByUsingOptionalChain(self.swDict)
//                self.dictionaryFetcher.fetchFromNSDictionaryUsingValueForKeyPath(self.nsDict)
            }
        }
    }
    
    
    // MARK: Shallow test
    
    func testShallowDictionaryFetchPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                // Set the basline: run test with this fetch method first and set the result as the baseline
                self.dictionaryFetcher.shallowFetchFromNSDictionary(self.nsDict)
                
                // Then comment out the baseline and comment this one in to compare
//                self.dictionaryFetcher.shallowFetchFromSwiftDictionary(self.swDict)
            }
        }
    }

}
