//
//  TableData.m
//  HeadFoldDemo
//
//  Created by lee on 16/11/25.
//  Copyright © 2016年 mjsfax. All rights reserved.
//

#import "TableData.h"

@implementation TableData

- (NSMutableArray *)dataArray {

    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<3; i++) {

            NSString *string = [NSString stringWithFormat:@"第%d个",i];
            [_dataArray addObject:string];
        }
        
    }
    return _dataArray;
}

@end
