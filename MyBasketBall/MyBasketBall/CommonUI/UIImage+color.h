//
//  UIImage+color.h
//  showTime
//
//  Created by msj on 16/8/24.
//  Copyright © 2016年 msj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (color)
+ (UIImage *)createImageWithColor:(UIColor *)color withSize:(CGSize)imageSize;
+ (UIImage *)scaleToSize:(UIImage *)img ratio:(float)ratio;
@end
