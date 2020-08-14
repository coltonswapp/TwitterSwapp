//
//  CBSTwitterUser.m
//  TwitterSwappDev35
//
//  Created by Colton Swapp on 8/13/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSTwitterUser.h"
#import "CBSUserMetrics.h"

@implementation CBSTwitterUser

- (instancetype)initWithName:(NSString *)name username:(NSString *)username publicMetrics:(CBSUserMetrics *)userMetrics
{
    self = [super init];
    if (self)
    {
        _name = name;
        _username = username;
        _publicMetrics = userMetrics;
    }
    return self;
}

@end

@implementation CBSTwitterUser (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * name = dictionary[@"name"];
    NSString * username = dictionary[@"username"];
//    NSDictionary* userMetricsDict = dictionary[@"public_metrics"];
    CBSUserMetrics * userMetrics = [[CBSUserMetrics alloc]initWithDictionary:dictionary[@"public_metrics"]];
    
    return [self initWithName:name username:username publicMetrics:userMetrics];
}

@end
