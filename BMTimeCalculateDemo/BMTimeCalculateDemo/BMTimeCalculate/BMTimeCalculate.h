//
//  BMTimeCalculate.h
//  GmacsIMKit
//
//  Created by skyming on 16/1/12.
//  Copyright © 2016年 skyming. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OperateConsumeBlock)(void);

/**
 *  Block 形式计算时间消耗，不适用异步线程，也不建议使用Block形式技术，根据测试在单纯加减操作情况，时间消耗误差 20% 左右
 *
 *  @param operation 耗时操作 Block
 *
 *  @return 消耗时间 单位毫秒，精确度纳秒
 */
extern double bmOperateConsumeCalculate (OperateConsumeBlock operation);



/**
 *  测试单元对象
 */
@interface BMTimeCalculateModel : NSObject
/**
 *  开始时间
 */
@property (nonatomic, assign) uint64_t startTime;
/**
 *  结束时间
 */
@property (nonatomic, assign) uint64_t endTime;
/**
 *  消耗的时间
 */
@property (nonatomic, assign) double elapsedTime;

/**
 *  测试单元标题
 */
@property (nonatomic, copy)   NSString *title;

/**
 *  初始化测试单元对象
 *
 *  @param title 测试单元标题
 *
 *  @return 测试单元对象
 */
- (instancetype)initWithTitle:(NSString *)title;

+ (instancetype)initWithTitle:(NSString *)title;
@end



/**
 *  性能耗时计时测试类
    用法：
    BMTimeCalculateModel *model = [BMTimeCalculateModel initWithTitle:@"回话列表数据获取"];
    开始计时：[BMTimeCalculate startCalculate:model];
    结束计时：[BMTimeCalculate endCalculate:model];
    输出单位毫秒(ms)、精确度微秒(μs)
 */
@interface BMTimeCalculate : NSObject

/**
 *  开始计时测试
 *
 *  @param model 计时测试单元
 */
+ (void)startCalculate:(BMTimeCalculateModel *)model;
/**
 *  结束计时测试
 *
 *  @param model 计时测试单元
 */
+ (void)endCalculate:(BMTimeCalculateModel *)model;;
@end
