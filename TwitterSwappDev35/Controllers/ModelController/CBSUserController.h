//
//  CBSUserController.h
//  TwitterSwappDev35
//
//  Created by Colton Swapp on 8/13/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBSTwitterUser.h"
#import "CBSUserMetrics.h"

NS_ASSUME_NONNULL_BEGIN

@interface CBSUserController : NSObject


+ (void)fetchUserForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<CBSTwitterUser *> * _Nullable))completion;


@end

NS_ASSUME_NONNULL_END
