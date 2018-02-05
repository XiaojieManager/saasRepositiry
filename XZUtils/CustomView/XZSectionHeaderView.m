//
//  XZSectionHeaderView.m
//  HuPin
//
//  Created by 小赵  on 2017/8/25.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import "XZSectionHeaderView.h"

@implementation XZSectionHeaderView

- (void)setFrame:(CGRect)frame{
    CGRect sectionRect = [self.tableView rectForSection:self.section];
    CGRect newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(sectionRect), CGRectGetWidth(frame), CGRectGetHeight(frame));
    [super setFrame:newFrame];
}

@end
