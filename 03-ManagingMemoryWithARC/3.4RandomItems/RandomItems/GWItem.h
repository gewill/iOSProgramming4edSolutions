//
//  GWItem.h
//  RandomItems
//
//  Created by Will Ge on 7/23/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWItem : NSObject

{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    
    GWItem *_containedItem;
    __weak GWItem *_container;
}

+ (instancetype)randomItem;

// GWItem 类的指定初始化方法
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;



- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;

- (void)setContainedItem:(GWItem *)item;
- (GWItem *)containedItem;

- (void)setContainer:(GWItem *)item;
- (GWItem *)container;

@end
