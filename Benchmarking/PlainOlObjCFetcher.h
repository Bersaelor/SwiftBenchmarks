//
//  PlainOlObjCFetcher.h
//  SwiftBenchmarking
//
//  Created by Konrad Feiler on 25/08/15.
//  Copyright (c) 2015 Maximilian Clarke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlainOlObjCFetcher : NSObject

/**
 Pure NSDictionary the good ol' ObjC way
 */
+ (NSString*) fetchUnsafeWithoutTypeCheckingFromNSDictionary: (NSDictionary*)dict;

/**
 Run the setup of the dict and the loop in Obj-C
 */
+ (void) fullTestRunForUnsafeFetching;

@end
