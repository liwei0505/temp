//
//  RegisterPersonInfoViewController.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/24.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "BaseViewController.h"
#import "RegisterViewModel.h"
@interface RegisterPersonInfoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

- (instancetype)initWithViewModel:(RegisterViewModel *)viewModel;

@end
