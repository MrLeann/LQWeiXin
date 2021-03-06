//
//  UIImage+TCRendering.h
//  Created by yzr on 16/4/23.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TCRendering)

/**
 *  1.设置按钮的时候，按钮会自动填充原始蓝色，加上这个可以显示原始图片
 *  2.也可以直接在 xcassets目录里的图片可以设置Render as 属性
 */

+ (instancetype)originalRenderingImageWithName:(NSString *)imageName;

- (instancetype)originalImage;

@end
