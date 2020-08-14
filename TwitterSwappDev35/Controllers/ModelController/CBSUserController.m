//
//  CBSUserController.m
//  TwitterSwappDev35
//
//  Created by Colton Swapp on 8/13/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSUserController.h"

static NSString * const baseURLString = @"https://api.twitter.com/2/users/by";
static NSString * const userFieldsComponent = @"user.fields";
static NSString * const userFieldsKey = @"verified,public_metrics";
static NSString * const usernamesComponent = @"usernames";
static NSString * const apiKey = @"authorization";
static NSString * const apiKeyValue = @"Bearer AAAAAAAAAAAAAAAAAAAAAN0vGwEAAAAApZdzONKGjVNKstXJeTSLCIK1Lmc%3DuoFQpEUKwUlKVT5spp8MGSY0ILXtDQJdrwPGOzl9GVDGTF9KYF";



@implementation CBSUserController

+ (void)fetchUserForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<CBSTwitterUser *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSMutableArray * queryItems = [NSMutableArray new];
    
    NSURLQueryItem * usersComponent = [NSURLQueryItem queryItemWithName:userFieldsComponent value:userFieldsKey];
    NSURLQueryItem * searchingUsernameComponent = [NSURLQueryItem queryItemWithName:usernamesComponent value:searchTerm.lowercaseString];
    
    [queryItems addObject:usersComponent];
    [queryItems addObject:searchingUsernameComponent];
    
    NSURLComponents * componentsURL = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    [componentsURL setQueryItems:queryItems];
    
    NSURL * finalURLWithoutAuth = [componentsURL URL];
    
    NSMutableURLRequest * finalURLWithAuth = [NSMutableURLRequest requestWithURL:finalURLWithoutAuth];
    [finalURLWithAuth addValue:apiKeyValue forHTTPHeaderField:apiKey];
    NSLog(@"%@", finalURLWithAuth);
    
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:finalURLWithAuth completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing the data %@", error);
            completion(nil); return;
        }
        NSArray * secondLevel = topLevelDictionary[@"data"];
        NSMutableArray * userPlaceholder = [NSMutableArray new];
        for (NSDictionary * dictionary in secondLevel)
        {
            CBSTwitterUser * user = [[CBSTwitterUser alloc] initWithDictionary:dictionary];
            [userPlaceholder addObject:user];
            
        }
        completion(userPlaceholder);
        
        
        
    }] resume];
    
    
    
    
}

@end
