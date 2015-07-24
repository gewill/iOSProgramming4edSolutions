//
//  main.m
//  RandomItems
//
//  Created by Will Ge on 7/23/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWItem.h"
#import "GWContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            GWItem *item = [GWItem randomItem];
            [items addObject:item];
        }
        
        
        GWContainer *container = [[GWContainer alloc] init];
        
        [container initWithContaionerName:@"New Container"
                           valueInDollars:1
                                withItems:items];
        NSLog(@"%@", container);
         
        
        items = nil;
        
        
    }
    return 0;
}
