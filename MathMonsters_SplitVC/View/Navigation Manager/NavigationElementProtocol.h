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

@protocol NavigationElementProtocol <NSObject>
@property(nonatomic) UIViewController<NavigationElementProtocol> * sender;
@property(nonatomic) ViewControllerPushType prefferedPushType;
@end

NS_ASSUME_NONNULL_END
