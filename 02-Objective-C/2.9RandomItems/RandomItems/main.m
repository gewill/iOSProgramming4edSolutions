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
       
        GWItem *itemWithNameAndSerial = [[GWItem alloc] initWithItemName:@"Maroon 5" serialNumber:@"N0CHA"];
        
        NSLog(@"%@", itemWithNameAndSerial);
        
        items = nil;
        
        
    }
    return 0;
}
