//
//  PlainOlObjCFetcher.m
//  SwiftBenchmarking
//
//  Created by Konrad Feiler on 25/08/15.
//  Copyright (c) 2015 Maximilian Clarke. All rights reserved.
//

#import "PlainOlObjCFetcher.h"

@implementation PlainOlObjCFetcher

+ (NSString*) fetchUnsafeWithoutTypeCheckingFromNSDictionary: (NSDictionary*)dict {
    return [(NSDictionary*)[(NSDictionary*)[(NSDictionary*)[dict objectForKey:@"MediaTypes"]
                                            objectForKey:@"Movies"]
                            objectForKey:@"Die Hard 2"]
            objectForKey:@"TagLine"];
}

+ (void) fullTestRunForUnsafeFetching {
    NSDictionary* testDict = @{@"MediaTypes": @{@"Movies":@{@"Die Hard 2":@{@"TagLine":@"Die Harder."}}}};

    for (int i=0; i< 10000; i++) {
        [PlainOlObjCFetcher fetchUnsafeWithoutTypeCheckingFromNSDictionary:testDict];
    }
}

@end
