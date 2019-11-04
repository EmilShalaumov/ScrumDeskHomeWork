//
//  ISSTaskCreationViewProtocol.h
//  ScrumDeskHomeWork
//
//  Created by Эмиль Шалаумов on 04.11.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import "UIKit/UIKit.h"

/**
 Describes task creation view interaction with VC
 */
@protocol ISSTaskCreationViewProtocol <NSObject>

/**
 Calls to create new task

 @param title task title
 @param desc task description
 */
- (void)taskDidCreatedWithTitle: (NSString *)title desc: (NSString *)desc;

@end
