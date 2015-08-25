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
    
    func test_001_NSDictionaryWithoutBridgingPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                // Set the basline: run test with this fetch method first and set the result as the baseline
                self.dictionaryFetcher.fetchFromNSDictionaryWithoutAnyBridgingInIfLetChain(self.nsDict)
            }
        }
    }

    func test_002_NSDictionaryByCastingToSwiftPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                
                self.dictionaryFetcher.fetchFromNSDictionaryByCastingToSwiftDictInIfLetChain(self.nsDict)
            }
        }
    }
    
    func test_003_DictionaryWithoutAnyCastingInIfLetChainPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                self.dictionaryFetcher.fetchFromSwiftDictionaryWithoutAnyCastingInIfLetChain(self.swDict)
            }
        }
    }

    func test_004_NSDictionaryByOptionalChainPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                self.dictionaryFetcher.fetchFromNSDictionaryByOptionalChain(self.nsDict)
            }
        }
    }

    func test_005_SwiftDictionaryByUsingOptionalChainPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                self.dictionaryFetcher.fetchFromSwiftDictionaryByUsingOptionalChain(self.swDict)
            }
        }
    }

    func test_006_NSDictionaryUsingValueForKeyPath() {
        self.measureBlock() {
            for _ in 0...10000 {
                self.dictionaryFetcher.fetchFromNSDictionaryUsingValueForKeyPath(self.nsDict)
            }
        }
    }

    
    // MARK: Shallow test
    
    func test_007_ShallowDictionaryFetchPerformance() {
        self.measureBlock() {
            for _ in 0...10000 {
                // Set the basline: run test with this fetch method first and set the result as the baseline
                self.dictionaryFetcher.shallowFetchFromNSDictionary(self.nsDict)
                
                // Then comment out the baseline and comment this one in to compare
//                self.dictionaryFetcher.shallowFetchFromSwiftDictionary(self.swDict)
            }
        }
    }
    
    func test_008_PlainObjCWithoutTypeChecking() {
        self.measureBlock() {
            self.dictionaryFetcher.testObjCWithoutTypeChecking()
        }
    }

}
