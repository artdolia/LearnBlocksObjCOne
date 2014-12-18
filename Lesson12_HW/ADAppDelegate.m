//
//  ADAppDelegate.m
//  Lesson12_HW
//
//  Created by A D on 12/19/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADAppDelegate.h"
#import "ADStudent.h"


typedef void(^SimpleBlock)(void);
typedef void(^BlockTakesString)(NSString*);
typedef NSComparisonResult (^Comparison)(id obj1, id obj2);

@interface ADAppDelegate()


@end

@implementation ADAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ADStudent *student1 = [[ADStudent alloc] init];
    student1.studentName = @"Vasiliy";
    student1.studentLastName = @"Ezhov";
    
    ADStudent *student2 = [[ADStudent alloc] init];
    student2.studentName = @"Vitali";
    student2.studentLastName = @"Ezhov";
    
    ADStudent *student3 = [[ADStudent alloc] init];
    student3.studentName = @"Victor";
    student3.studentLastName = @"Galkin";
    
    ADStudent *student4 = [[ADStudent alloc] init];
    student4.studentName = @"Victor";
    student4.studentLastName = @"Motalkin";
    
    ADStudent *student5 = [[ADStudent alloc] init];
    student5.studentName = @"Alex";
    student5.studentLastName = @"Beliy";
    
    ADStudent *student6 = [[ADStudent alloc] init];
    student6.studentName = @"Alexey";
    student6.studentLastName = @"Kostrov";
    
    ADStudent *student7 = [[ADStudent alloc] init];
    student7.studentName = @"Pavel";
    student7.studentLastName = @"Kostrov";
    
    ADStudent *student8 = [[ADStudent alloc] init];
    student8.studentName = @"Pavel";
    student8.studentLastName = @"Razumov";
    
    
    /********************* Level STUDENT *********************/
    
    //unsorted array
    NSArray *students = [NSArray arrayWithObjects:student1, student2, student3, student4,
                         student5, student6, student7, student8, nil];
    
    NSLog(@"\nStudents: %@", students);
    
    //comparison block
    NSComparisonResult (^comparison)(ADStudent *,ADStudent *) = ^(ADStudent *obj1, ADStudent *obj2){
        
        return [obj1.studentLastName isEqualToString:obj2.studentLastName] ? [obj1.studentName compare:obj2.studentName] :
        [obj1.studentLastName compare:obj2.studentLastName];
    };
   
    //sorted array
    NSArray *sortedStudents = [students sortedArrayUsingComparator:comparison];
    
    NSLog(@"\nSorted students: %@", sortedStudents);
    
    
    SimpleBlock block = ^{
        NSLog(@"Simple Block Call");
    };
    
    block();
    
    NSString * testString =[NSString stringWithFormat:@"HELLO"];
    
    BlockTakesString stringBlock = ^(NSString *testString){
      
        NSLog(@"String from Block - %@", testString);
        
    };
    
    stringBlock(testString);
    
    
    testString = [NSString stringWithFormat:@"HEllo"];
    
    [self methodTakesBlock:^(NSString * hulla) {
        NSLog(@"Block - %@", hulla);
    } withString:testString];
    
    
    
    
    return YES;
}


-(void) methodTakesBlock:(BlockTakesString)block withString:(NSString*) string{
    
    NSString *string1 = [NSString stringWithFormat:@"Yeah!"];
    block([NSString stringWithFormat:@"%@%@", string, string1]);

}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
