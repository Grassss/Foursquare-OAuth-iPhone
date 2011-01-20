//
//  FSVenueRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/12/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSVenueRequestor.h"
#import "FSURLRequest.h"

@implementation FSVenueRequestor

@synthesize venueDictionary, favoriteVenueItems, nearbyVenueItems;

#pragma mark -
#pragma mark Create instance of FSVenueRequestor
- (id)initFSVenueRequest
{
	if (self = [super init])
	{
		//[self getNearbyVenueInfo:@"33.980478,-118.397191"];
	}
	
    return self;
}

#pragma mark -
#pragma mark Venue Information
- (NSDictionary *)getVenueInfo:(NSString *)venueID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *venueDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@?", venueID] dictionaryKey:@"venueDictionary" httpMethod:@"GET"];
	
	//[self disectVenueInfo:venueDict];	
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return venueDict;
}

- (NSArray *)getVenueInfo:(NSString *)venueID venueType:(NSString *)type
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *venueDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@?", venueID] dictionaryKey:@"venueDictionary" httpMethod:@"GET"];
	
	NSArray *venueArray = [self disectVenueInfo:venueDict forType:type];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return venueArray;
}


#pragma mark -
#pragma mark Venue Information Disection
- (NSArray *)disectVenueInfo:(NSDictionary *)dict forType:(NSString *)type
{
	NSArray *venueItems;
	
	NSDictionary *info = [dict objectForKey:@"venueDictionary"];
	NSDictionary *response = [info objectForKey:@"response"];
	NSArray *groups = [response objectForKey:@"groups"];
	
	for (int i = 0; i < [groups count]; i++) {
		NSDictionary *groupItems = [groups objectAtIndex:i];
		NSString *venueType = [groupItems objectForKey:@"type"];

		if ([venueType isEqualToString:@"favorites"]) {
			//self.favoriteVenueItems = [groupItems objectForKey:@"items"];
			venueItems = [groupItems objectForKey:@"items"];
			
			return venueItems;
		}
		
		if ([venueType isEqualToString:@"nearby"]) {
			//self.nearbyVenueItems = [groupItems objectForKey:@"items"];
			venueItems = [groupItems objectForKey:@"items"];
			
			return venueItems;			
		}				
	}
}


@end
