//
//  DetailTemplateViewController.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationElementProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailTemplateViewController : UIViewController <NavigationElementProtocol>
- (instancetype)initWithTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
