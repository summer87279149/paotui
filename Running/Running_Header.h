//
//  Running_Header.h
//  Running
//
//  Created by 吕志杰 on 2017/8/24.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#ifndef Running_Header_h
#define Running_Header_h

#import <Foundation/Foundation.h>
//屏幕尺寸
#define kSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

//屏幕尺寸
#define SCREEN_WIDTH               MIN(CGRectGetWidth([[UIScreen mainScreen] bounds]),CGRectGetHeight([[UIScreen mainScreen] bounds]))
#define SCREEN_HEIGHT              MAX(CGRectGetWidth([[UIScreen mainScreen] bounds]),CGRectGetHeight([[UIScreen mainScreen] bounds]))

#define PINGCHNAGSTORYBOARD(storyname,storyID)({[self.navigationController pushViewController:[[UIStoryboard storyboardWithName:storyname bundle:nil] instantiateViewControllerWithIdentifier:storyID] animated:YES];\
})

#define NAV_STYLE ({ self.navigationController.navigationBar.translucent = NO;\
self.navBarBgAlpha = 1;\
self.navBarTintColor = [UIColor blackColor];\
})

#define HLLURL @"http://hll.all-360.com/"
#define SERVERSURL @"http://hll.all-360.com"

#define NOXUNHUANSTORYBOARD(storyname,storyID)({[weakself.navigationController pushViewController:[[UIStoryboard storyboardWithName:storyname bundle:nil] instantiateViewControllerWithIdentifier:storyID] animated:YES];\
})
#define BACK_CELL_COLOR [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]

typedef NS_ENUM(NSInteger, SECTION_INDEX) {
    SECTIONOSTATE  = 0,
    SECTIONTSTATE,
    SECTIONZSTATE,
    SECTIONFSTATE,
    SECTIONSSTATE,
    SECTIONNSTATE
};


#define KFNavBarColor [UIColor colorWithRed:242/255.0f green:0/255.0f blue:148/255.0f alpha:1.0f]


#endif /* Running_Header_h */
