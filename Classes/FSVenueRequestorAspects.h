//
//  FSVenueRequestorAspects.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSVenueRequestorAspects : NSObject {

}

- (id)initFSRequestorAspects;
- (NSDictionary *)herenowVenueAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)tipsVenueAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)photosVenueAPIRequest:(NSDictionary *)queryData;
@end
