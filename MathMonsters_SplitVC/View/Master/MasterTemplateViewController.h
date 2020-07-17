//
//  MasterTemplateViewController.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MasterDelegate;

@interface MasterTemplateViewController : UIViewController
@property(nonatomic, weak) id<MasterDelegate> delegate;
- (instancetype)initWithTitle:(NSString *)title;
@end

@protocol MasterDelegate <NSObject>
- (void)masterViewController:(UIViewController *)templateViewController showDetail:(UIViewController *)detailViewController;
@end

NS_ASSUME_NONNULL_END
