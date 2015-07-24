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
        
        for (int i = 0; i < 10; i++) {
            GWItem *item = [GWItem randomItem];
            [items addObject:item];
        }
        
        for (GWItem *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items = nil;
        
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        [items insertObject:@"Zero" atIndex:0];
//
//        for (int i = 0; i < [items count]; i++) {
//            NSString *item = [items objectAtIndex:i];
//            NSLog(@"%@", item );
//        }
//        
//        for (NSString *item in items) {
//            NSLog(@"%@", item );
//        }
//        
//        GWItem *item = [[GWItem alloc] init];
//        [item setItemName:@"RED"];
//        [item setSerialNumber:@"A1B2C"];
//        item.ValueInDollars = 100;
        
//        NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);
        
//        GWItem *item = [[GWItem alloc] initWithItemName:@"RED"
//                                         valueInDollars:100
//                                           serialNumber:@"A1B2C"];
//        NSLog(@"%@", item);
//        
//        GWItem *itemWithName = [[GWItem alloc] initWithItemName:@"Blue"];
//        NSLog(@"%@", itemWithName);
//        
//        GWItem *itemWithNoName = [[GWItem alloc] init];
//        NSLog(@"%@", itemWithNoName);
//        
//        items = nil;
        
        
    }
    return 0;
}
