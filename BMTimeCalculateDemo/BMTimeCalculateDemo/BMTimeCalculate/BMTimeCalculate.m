//
//  BMTimeCalculate.m
//  GmacsIMKit
//
//  Created by skyming on 16/1/12.
//  Copyright © 2016年 skyming. All rights reserved.
//

#import "BMTimeCalculate.h"
#include <mach/mach_time.h>

// 单位换算 1s = 10^3 ms = 10^6 μs = 10^9 ns

// 输出单位毫秒(ms)，精确度纳秒(ns), 原生 mach_absolute_times 输入,
static double subtractTimes(uint64_t start, uint64_t end)
{
    static double conversion = 0.0;
    uint64_t elapsed = end - start;
    
    if (start > end) {
        printf ("Error: start > end \n");
        return -1.0f;
    }
    
    if(conversion == 0.0)
    {
        mach_timebase_info_data_t info;
        kern_return_t __error = mach_timebase_info(&info); //Convert the timebaseinto seconds
        
        if(__error != KERN_SUCCESS)
        {
            printf ("Error: mach_timebase_info failed\n");
            return -1.0f;
        }
        conversion = 1e-6 * (double) info.numer / (double) info.denom;
    }
    return conversion * (double)elapsed; // ms
}

//???: 通过Block形式 计算，同样的操作比 model 形式 损耗 20% 左右
double bmOperateConsumeCalculate (OperateConsumeBlock operation)
{
    uint64_t start = mach_absolute_time ();
    operation();
    uint64_t end = mach_absolute_time ();
    return subtractTimes(start, end);
}


@implementation BMTimeCalculateModel

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        _title = title;
    }
    return self;
}
+ (instancetype)initWithTitle:(NSString *)title {
    return [[BMTimeCalculateModel alloc]initWithTitle:title];
}
@end


@implementation BMTimeCalculate

//输出单位毫秒(ms)、精确度微秒(μs)
+ (void)startCalculate:(BMTimeCalculateModel *)model {
    model.startTime = mach_absolute_time(); // ns
    NSLog(@"%@ - 开始时间 － %llu", model.title, model.startTime/1000); // μs
}

+ (void)endCalculate:(BMTimeCalculateModel *)model {
    model.endTime = mach_absolute_time(); // ns
    model.elapsedTime = subtractTimes(model.startTime, model.endTime);
    NSLog(@"%@ - 结束时间 － %llu", model.title, model.endTime/1000); // μs
    NSLog(@"%@ - 时间消耗 - %.3f ms", model.title, model.elapsedTime);
}

@end

