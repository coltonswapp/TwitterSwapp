//
//  CBSUserMetrics.h
//  TwitterSwappDev35
//
//  Created by Colton Swapp on 8/13/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBSUserMetrics : NSObject

@property (nonatomic, readonly)NSInteger followers_count;
@property (nonatomic, readonly)NSInteger following_count;
@property (nonatomic, readonly)NSInteger tweet_count;

- (instancetype)initWithFollowersCount:(NSInteger)followersCount
                        followingCount:(NSInteger)followingCount
                            tweetCount:(NSInteger)tweetCount;

@end

@interface CBSUserMetrics (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end



NS_ASSUME_NONNULL_END
