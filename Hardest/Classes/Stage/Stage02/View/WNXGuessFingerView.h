//
//  WNXGuessFingerView.h
//  Hardest
//
//  Created by sfbest on 16/3/21.
//  Copyright © 2016年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNXGuessFingerView : UIView

- (void)startAnimationWithDuration:(NSTimeInterval)duration completion:(void (^)(int winIndex))completion;

- (void)showResultAnimationCompletion:(void (^)())completion;

- (void)cleanData;

@end