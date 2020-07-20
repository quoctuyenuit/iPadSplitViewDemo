//
//  NavigationElementProtocol.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/20/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ViewControllerPushType) {
    ViewControllerPushTypeReplaceCurrentDetail,
    ViewControllerPushTypePushCurrentDetail,
    ViewControllerPushTypePushCurrentMaster,
};

@interface NavigationElementProtocol : NSObject
@property(nonatomic) id sender;
@end

NS_ASSUME_NONNULL_END
