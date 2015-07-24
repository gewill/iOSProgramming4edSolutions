//
//  GWItem.m
//  RandomItems
//
//  Created by Will Ge on 7/23/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWItem.h"

@implementation GWItem

- (void)dealloc
{
    NSLog(@"Destroyed: %@",self);
}

- (void)setItemName:(NSString *)str{ _itemName = str; }
- (NSString *)itemName{ return _itemName; }

- (void)setSerialNumber:(NSString *)str{ _serialNumber = str; }
- (NSString *)serialNumber{ return _serialNumber; }

- (void)setValueInDollars:(int)v{ _valueInDollars = v; }
- (int)valueInDollars{ return _valueInDollars; }

- (NSDate *)dateCreated{ return _dateCreated; }

- (void)setContainedItem:(GWItem *)item
{
    _containedItem = item;
    
    item.container = self;

}
- (GWItem *)containedItem { return _containedItem; }

- (void)setContainer:(GWItem *)item { _container = item; }
- (GWItem *)container { return _container; }




- (NSString *)description
{
    NSString *descriptionString =
        [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                          self.itemName,
                          self.serialNumber,
                          self.valueInDollars,
                          self.dateCreated];
    return descriptionString;
         
}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    // 调用父类的指定初始化方法
    self = [super init];
    
    // 父类的指定初始化方法是否成功创建了父类对象？
    if (self) {
        // 为实例变量设定初始值
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        
        // 设置 _dateCreated 的值为系统当前时间
        _dateCreated = [[NSDate alloc] init ];
        
    }
    
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList [adjectiveIndex],
                            randomNounList [nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    GWItem *newItem = [[self alloc] initWithItemName:randomName
                                      valueInDollars:randomValue
                                        serialNumber:randomSerialNumber];
    
    return newItem;
}
@end
