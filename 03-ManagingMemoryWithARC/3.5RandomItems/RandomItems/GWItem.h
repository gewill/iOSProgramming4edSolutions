//
//  GWItem.h
//  RandomItems
//
//  Created by Will Ge on 7/23/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWItem : NSObject


    @property (nonatomic, copy) NSString *itemName;
    @property (nonatomic, copy) NSString *serialNumber;
    @property (nonatomic) int valueInDollars;
    @property (nonatomic, readonly, strong) NSDate *dateCreated;
    
    @property (nonatomic, strong) GWItem *containedItem;
    @property (nonatomic, weak) GWItem *container;


+ (instancetype)randomItem;

// GWItem 类的指定初始化方法
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;



@end
