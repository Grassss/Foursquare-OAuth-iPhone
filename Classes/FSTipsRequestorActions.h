//
//  FSTipsRequestorActions.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSTipsRequestorActions : NSObject {

}

- (id)initFSRequestorActions;
- (NSDictionary *)marktodoTipsAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)markdoneTipsAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)unmarkTipsAPIRequest:(NSDictionary *)queryData;

@end
