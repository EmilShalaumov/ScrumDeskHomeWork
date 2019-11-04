//
//  ISSTaskCreationView.h
//  ScrumDeskHomeWork
//
//  Created by Эмиль Шалаумов on 04.11.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSTaskCreationViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Task creation view (Pop-Up view) implementation
 */
@interface ISSTaskCreationView : UIView

@property (nonatomic, weak) id<ISSTaskCreationViewProtocol> delegate;

/**
 Shows Pop-Up view
 */
- (void) makeViewVisible;

@end

NS_ASSUME_NONNULL_END
