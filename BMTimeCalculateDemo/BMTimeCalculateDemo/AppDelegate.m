//
//  AppDelegate.m
//  BMTimeCalculateDemo
//
//  Created by skyming on 16/5/7.
//  Copyright © 2016年 skyming. All rights reserved.
//

#import "AppDelegate.h"
#import "BMTimeCalculate.h"

#define LOOPAGE 10000

@interface AppDelegate ()
{
    NSMutableArray *test;
    double totalTime;
    double totalTimex;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CFTimeInterval start = CACurrentMediaTime();
    // dosomething
    [NSThread sleepForTimeInterval:3.0f];
    CFTimeInterval end = CACurrentMediaTime();
    NSLog(@"时间损耗 = %f", end - start);
    
    clock_t startx = clock();
    [NSThread sleepForTimeInterval:3.0f];
    clock_t endx = clock();
    NSLog(@"时间损耗 = %f", (double)(endx - startx)/CLOCKS_PER_SEC);
    
    test = [NSMutableArray array];
    for (int i= 0; i < 100000000; i++) {
        [test addObject:@(i)];
    }
    totalTime = 0.0f;
    totalTimex = 0.0f;

    // 同步方法测试
//    [self synTest1];
//    [self synTest2];
    for (int i = 0; i < 10; i ++) {
        [self synTest3];
    }
    NSLog(@"\n");
    NSLog(@"ForLoop Time-Block: %.3f ms", totalTime/10.0f);
    NSLog(@"Enumeration Time-Block: %.3f ms\n", totalTimex/10.0f);
    NSLog(@"\n");

//    NSLog(@"4 start");
//    [self syntest4];
    
    totalTime = 0.0f;
    totalTimex = 0.0f;

    for (int i = 0; i < 10; i ++) {
        [self syntest5];
    }
    NSLog(@"\n");
    NSLog(@"ForLoop Time-Model: %.3f ms", totalTime/10.0f);
    NSLog(@"Enumeration Time-Model: %.3f ms\n", totalTimex/10.0f);
    NSLog(@"\n");
    // 异步方法测试
    BMTimeCalculateModel *model = [BMTimeCalculateModel initWithTitle:@"动画操作"];
   // 开始计时：
    [BMTimeCalculate startCalculate:model];
    [UIView animateWithDuration:1.0f animations:^{
        //结束计时：
        [BMTimeCalculate endCalculate:model];
    }];

    return YES;
    
}

- (void)synTest1 {
    double time;
    
    // A
    time = bmOperateConsumeCalculate(^{
        NSLog(@"Block: %@", [NSThread currentThread]);
        for (int i = 0; i < LOOPAGE; i++) {
            NSLog(@"TestX %d", i);
        }
    });
    NSLog(@"循环耗时Block: %.3f ms", time);
    
    BMTimeCalculateModel *model = [BMTimeCalculateModel initWithTitle:@"循环耗时Model"];
    // 开始计时：
    [BMTimeCalculate startCalculate:model];
    NSLog(@"Block: %@", [NSThread currentThread]);
    for (int i = 0; i < LOOPAGE; i++) {
        NSLog(@"TestX %d", i);
    }
    [BMTimeCalculate endCalculate:model];
    
}

- (void)synTest2 {
    __block int i, j, count;
    double current = 0.0;
    __block double answer = 0.0;
    double elapsed = 0.0;
    int dim1 = 256;
    int dim2 = 256;
    int size = 4*dim1*dim2;
    
    //Allocatesome memory and warm it up
    double *array =(double*)malloc(size*sizeof(double));
    for(i=0;i<size;i++)
    {
        array[i] = (double)i;
    }
    
    count = 5;
    for(i = 0; i < count; i++)
    {
        current = bmOperateConsumeCalculate(^{
            //dosome work
            for(j=0;j< size; j++)
            {
                answer += sqrt(array[j]);
            }
        });
        printf("Timefor iteration: %.3f ms for answer: %f\n",current, answer);
        elapsed+= current;
    }
    
    printf("\nTotaltime in seconds = %.3f for answer: %f\n",elapsed/count,answer);
    free(array);
}

- (void)synTest3 {
    
    NSLog(@"3 start");

    double start = CFAbsoluteTimeGetCurrent();
    //You code here...
    __block int sum = 0;
    double time = bmOperateConsumeCalculate(^{
        for (int i = 0;i < test.count; i++) {
            int key = [test[i] intValue];
            sum += key;
            sum -= key;
        }
    });
    
    totalTime += time;
    double end = CFAbsoluteTimeGetCurrent();
    NSLog(@"cost time = %@", @((end - start)));
//    NSDate* tmpStartData = [NSDate date];
//    //You code here...
//    double deltaTime = [[NSDate date] timeIntervalSinceDate:tmpStartData];
//    NSLog(@"cost time = %f s", deltaTime);
//    clock_t start = clock();
//    time_t startx = time(&startx)
    NSLog(@"ForLoop Time-Block: %.3f ms", time);
    
    time = bmOperateConsumeCalculate(^{
        for (id obj in test) {
            int key = [obj intValue];
            sum += key;
            sum -= key;
        }
    });
    

    totalTimex += time;

    NSLog(@"Enumeration Time-Block: %.3f ms", time);
}

- (void)syntest4 {
    int sum = 0;
    
    double date_s = CACurrentMediaTime() * 1000;
    for (int i = 0;i < test.count; i++) {
        sum += 1;
    }
    double date_e =  CACurrentMediaTime() * 1000;
    NSLog(@"ForLoop Time-CAMedia: %.3f ms", date_e - date_s);
    
    date_s =  CACurrentMediaTime() * 1000;
    for (id obj in test) {
        sum += 1;
    }
    date_e =  CACurrentMediaTime() * 1000;
    NSLog(@"Enumeration Time-CAMedia: %.3f ms", date_e - date_s);
}


- (void)syntest5 {

    int sum = 0;
    
    NSLog(@"5 start");

    BMTimeCalculateModel *model = [BMTimeCalculateModel initWithTitle:@"ForLoop Time-Model"];
    // 开始计时：
    [BMTimeCalculate startCalculate:model];
    for (int i = 0;i < test.count; i++) {
        int key = [test[i] intValue];
        sum += key;
        sum -= key;
    }
    //结束计时：
    [BMTimeCalculate endCalculate:model];
    
    totalTime += model.elapsedTime;

    NSLog(@"ForLoop Time-Model: %.3f ms", model.elapsedTime);

    model = [BMTimeCalculateModel initWithTitle:@"Enumeration Time-Model"];
    // 开始计时：
    [BMTimeCalculate startCalculate:model];
    for (id obj in test) {
        int key = [obj intValue];
        sum += key;
        sum -= key;
    }
    //结束计时：
    [BMTimeCalculate endCalculate:model];
    totalTimex += model.elapsedTime;
    
    NSLog(@"Enumeration Time-Model: %.3f ms", model.elapsedTime);


}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
