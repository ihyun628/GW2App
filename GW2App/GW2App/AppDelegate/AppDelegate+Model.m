//
//  AppDelegate+Model.m
//  GW2App
//
//  Created by min_liu on 2018/2/8.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "AppDelegate+Model.h"

// for Tools
#import "ModelKey.h"
#import "ModelManager.h"

// for Model
#import "ItemModel.h"

@implementation AppDelegate (Model)

-(void)initialModel{
    [[ModelManager sharedInstance] setModelWithKey:D_ITEMS_KEY
                                         withModel:[[ItemModel alloc] init]];
    
    [[ModelManager sharedInstance] setModelWithKey:D_TIME_GOLD_KEY
                                         withModel:[[ItemModel alloc] init]];
    
    [[ModelManager sharedInstance] setModelWithKey:D_ITEMS_GEMS_KEY
                                         withModel:[[ItemModel alloc] init]];
    
    [[ModelManager sharedInstance] setModelWithKey:D_ITEMS_GOLD_KEY
                                         withModel:[[ItemModel alloc] init]];
    
    [[ModelManager sharedInstance] setModelWithKey:D_ITEMS_GEMS_TO_GOLD_KEY
                                         withModel:[[ItemModel alloc] init]];
    
    [[ModelManager sharedInstance] setModelWithKey:D_ITEMS_GOLD_TO_GEMS_KEY
                                         withModel:[[ItemModel alloc] init]];
}

@end
