//
//  ViewController.h
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 11/4/22.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "CustomCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *customTableView;

@end

