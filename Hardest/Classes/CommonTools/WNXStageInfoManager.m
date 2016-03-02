//
//  WNXStageInfoManger.m
//  Hardest
//
//  Created by sfbest on 16/2/29.
//  Copyright © 2016年 维尼的小熊. All rights reserved.
//

#import "WNXStageInfoManager.h"
#import "WNXStageInfo.h"

#define fileName @"stageInfos"
#define path [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:fileName]

@interface WNXStageInfoManager ()

@property (nonatomic, strong) NSMutableDictionary *allStageInfos;

@end

@implementation WNXStageInfoManager

static WNXStageInfoManager *instance = nil;
+ (instancetype)sharedStageInfoManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [WNXStageInfoManager new];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.allStageInfos = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!self.allStageInfos) {
            self.allStageInfos = [NSMutableDictionary dictionary];
            WNXStageInfo *info = [WNXStageInfo new];
            info.num = 1;
            info.rank = @"s";
            info.unlock = YES;
            info.score = 29;
            [self.allStageInfos setObject:info forKey:@1];
            
            WNXStageInfo *info2 = [WNXStageInfo new];
            info2.num = 2;
            info2.rank = @"a";
            info2.score = 10;
            info2.unlock = YES;
            [self.allStageInfos setObject:info2 forKey:@2];
//
            WNXStageInfo *info3 = [WNXStageInfo new];
            info3.num = 3;
            [self.allStageInfos setObject:info3 forKey:@3];
            
//            WNXStageInfo *info4 = [WNXStageInfo new];
//            info4.num = 4;
//            [self.allStageInfos setObject:info forKey:@1];
        }
    }
    
    return self;
}

- (BOOL)saveStageInfo:(WNXStageInfo *)stageInfo {
    
    if (stageInfo.num <= 0) return NO;
    
    [self.allStageInfos setObject:stageInfo forKey:@(stageInfo.num)];

    return [NSKeyedArchiver archiveRootObject:self.allStageInfos toFile:path];
}

- (WNXStageInfo *)stageInfoWithNumber:(int)number {
    NSAssert(number > 0, @"读取必须大于0啊");
    
    WNXStageInfo *info = self.allStageInfos[@(number)];
    
    return info;
}

@end
