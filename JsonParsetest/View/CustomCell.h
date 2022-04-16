//
//  CustomCell.h
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 13/4/22.
//

#import <UIKit/UIKit.h>
#import "Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *apiNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *apiDescription;
- (void) updateViewWith:(NSString *) apiName ands: (NSString *)apiDescription;
@end

NS_ASSUME_NONNULL_END
