//
//  ADStudent.m
//  Lesson12_HW
//
//  Created by A D on 12/19/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADStudent.h"

@implementation ADStudent

@synthesize studentLastName = _studentLastName;
@synthesize studentName = _studentName;

-(NSString*) description{
    return [NSString stringWithFormat:@"%@ %@", self.studentName, self.studentLastName];
}


@end
