//
//  GWContainer.m
//  RandomItems
//
//  Created by Will Ge on 7/24/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWContainer.h"

@implementation GWContainer

- (void)setContainerName:(NSString *)str { _containerName = str; };
- (NSString *)containerName { return _containerName; };


- (void)setItems:(NSMutableArray *)items { _items = items; };
- (NSMutableArray *)items { return _items; };


- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"Container: %@ : Worth $%d, contain: %@",
     self.containerName,
     self.valueInDollars,
     self.items];
    return descriptionString;
    
}

- (instancetype)initWithContaionerName:(NSString*)name
                        valueInDollars:(int)value
                             withItems:(NSMutableArray *)items
{
    
    self = [super init];
    
    if (self) {
        _containerName = name;
        
        int sumValue = value;
        for (GWContainer *item in items) {
            sumValue += item.valueInDollars;
        }
        _valueInDollars = sumValue;
        
        NSMutableArray *itemArray = [[NSMutableArray alloc] init];
        for (GWContainer *item in items) {
            [itemArray addObject:item];
        }
        _items = itemArray;
    }
    
    return self;
}
@end
