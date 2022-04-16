//
//  CustomCell.m
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 13/4/22.
//

#import "CustomCell.h"


@implementation CustomCell

-(void)updateViewWith:(NSString *)apiName ands:(NSString *)apiDescription{
    self.apiDescription.text = apiDescription;
    self.apiNameLbl.text = apiName;
}

@end
