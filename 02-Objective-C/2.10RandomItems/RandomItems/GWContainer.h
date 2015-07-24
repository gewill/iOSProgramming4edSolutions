//
//  GWContainer.h
//  RandomItems
//
//  Created by Will Ge on 7/24/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWItem.h"

@interface GWContainer : GWItem
{
    NSMutableArray *_items;
    NSString *_containerName;
    
    
}
- (instancetype)initWithContaionerName:(NSString*)name
                        valueInDollars:(int)value
                             withItems:(NSMutableArray *)items;

- (void)setItems:(NSMutableArray *)items;
- (NSMutableArray *)items;

- (void)setContainerName:(NSString *)str;
- (NSString *)containerName;


@end
