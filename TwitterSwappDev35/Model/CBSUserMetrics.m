//
//  CBSUserMetrics.m
//  TwitterSwappDev35
//
//  Created by Colton Swapp on 8/13/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSUserMetrics.h"

@implementation CBSUserMetrics

- (instancetype)initWithFollowersCount:(NSInteger)followersCount followingCount:(NSInteger)followingCount tweetCount:(NSInteger)tweetCount
{
    self = [super init];
    if (self)
    {
        _followers_count = followersCount;
        _following_count = followingCount;
        _tweet_count = tweetCount;
    }
    return self;
}

@end

@implementation CBSUserMetrics (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger followersCount = [dictionary[@"followers_count"] intValue];
    NSInteger followingCount = [dictionary[@"following_count"] intValue];
    NSInteger tweetCount = [dictionary[@"tweet_count"] intValue];
    
    return [self initWithFollowersCount:followersCount followingCount:followingCount tweetCount:tweetCount];
}

@end
