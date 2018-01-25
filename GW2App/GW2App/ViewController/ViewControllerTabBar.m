//
//  ViewControllerTabBar.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//

#import "ViewControllerTabBar.h"


// for ViewController
#import "MainViewController.h"

#import "WorldBossViewController.h"
#import "ItemsViewController.h"
#import "DungeonsViewController.h"
#import "GuildViewController.h"
#import "MoreViewController.h"
#import "LoginViewController.h"

#import "ViewControllerNavigationController.h"
// for constants
#import "Constants.h"
#import "GW2BroH_Tools.h"

@interface ViewControllerTabBar ()


@property (nonatomic , strong) NSArray *firstArray;
@property (nonatomic , strong) NSArray *secondArray;

@end

@implementation ViewControllerTabBar


-(id)init{
    self = [super init];
    if ( self != nil ) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view from its nib.
    
    /* Array2 */
    /* 將viewController做成實體 並使用Navigation控制*/
    NSMutableArray *items = [[NSMutableArray alloc]init];
    WorldBossViewController *ViewController1 = [[WorldBossViewController alloc] init];
    ViewControllerNavigationController *vc1 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController1];
    
    ItemsViewController *ViewController2 = [[ItemsViewController alloc] init];
    ViewControllerNavigationController *vc2 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController2];
    
    DungeonsViewController *ViewController3 = [[DungeonsViewController alloc] init];
    ViewControllerNavigationController *vc3 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController3];
    
    GuildViewController *ViewController4 = [[GuildViewController alloc] init];
    ViewControllerNavigationController *vc4 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController4];
    
    MoreViewController *ViewController5 = [[MoreViewController alloc] init];
    ViewControllerNavigationController *vc5 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController5];

    _secondArray = [[NSArray alloc]initWithObjects: vc1, vc2, vc3, vc4, vc5, nil];

    /* Array1 */
    MainViewController *mainVC = [[MainViewController alloc] init];
    _firstArray = [[NSArray alloc] initWithObjects:[[ViewControllerNavigationController alloc] initWithFirstViewcontroller:mainVC], nil];
    
    /* 開啟切到陣列1顯示主畫面 */
    [self.tabBar setHidden:YES];
    [self setViewControllers:_firstArray animated:YES];
    
    
    /* TabBar顯示文字顏色文字大小 未選中 */
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    /* TabBar顯示文字顏色文字大小 選中 */
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* 切換TabBar切換ViewController*/
-(void)changeViewControllerWithIndex:(EnumTabBarIndex)index{
    switch (index) {
        case EnumTabBarIndexWorldBoss:
        case EnumTabBarIndexDungeons:
        case EnumTabBarIndexMore:
        case EnumTabBarIndexGuild:
        case EnumTabBarIndexItems:
        {
            self.viewControllers = _secondArray;
            
            index = index - EnumTabBarIndexWorldBoss;
            
            [self.tabBar setHidden:NO];
            
            self.tabBar.backgroundColor  = VC_START_MENU_BACKGROUND_COLOR;
            
        }
            break;
        
        case EnumTabBarIndexStartMenu:
        {
            self.viewControllers = _firstArray;
            
            [self.tabBar setHidden:YES];
        }
        
        {
            NSLog(@"Select wrong index (%d) !!" , index);
        }
            break;
    }
    self.tabBar.tintColor = VC_START_MENU_BACKGROUND_COLOR;
    /* 換完陣列切換陣列內值 */
    self.selectedIndex = index;
    
}

@end
