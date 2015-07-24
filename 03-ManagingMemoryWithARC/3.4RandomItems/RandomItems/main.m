//
//  main.m
//  RandomItems
//
//  Created by Will Ge on 7/23/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        GWItem *backpack = [[GWItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        GWItem *calcullator = [[GWItem alloc] initWithItemName:@"Calcullator"];
        [items addObject:calcullator];

        backpack.containedItem = calcullator;
        
        backpack = nil;
        calcullator = nil;
        
        for (GWItem * item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items = nil;
        
    }
    return 0;
}
