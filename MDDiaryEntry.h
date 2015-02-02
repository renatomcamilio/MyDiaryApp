//
//  MyDiary.h
//  MyDiary
//
//  Created by Renato Camilio on 2/1/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MDDiaryEntry : NSManagedObject

@property (nonatomic, retain) NSString * location;
@property (nonatomic) NSTimeInterval date;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * image;

@end
