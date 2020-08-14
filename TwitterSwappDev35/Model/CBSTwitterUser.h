//
//  CBSTwitterUser.h
//  TwitterSwappDev35
//
//  Created by Colton Swapp on 8/13/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBSUserMetrics.h"

NS_ASSUME_NONNULL_BEGIN

@interface CBSTwitterUser : NSObject

@property (nonatomic, copy, readonly)NSString * name;
@property (nonatomic, copy, readonly)NSString * username;
@property (nonatomic, copy, readonly)CBSUserMetrics * publicMetrics;

- (instancetype)initWithName:(NSString *)name
                    username:(NSString *)username
                 publicMetrics:(CBSUserMetrics *)userMetrics;

@end

@interface CBSTwitterUser (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
