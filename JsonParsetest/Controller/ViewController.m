//
//  ViewController.m
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 11/4/22.
//

#import "ViewController.h"
#import "ViewController_Extention.h"
#import "NetworkHandler.h"

@interface ViewController ()

@end

@implementation ViewController
NSMutableArray <Model *> *modelData;

- (void)viewDidLoad {
    [super viewDidLoad];
    modelData = NSMutableArray.new;
    [[[NetworkHandler alloc] init] fetchData:@"https://api.publicapis.org/entries" at:^(NSMutableArray<Model *> * _Nullable model, NSError * _Nullable err) {
        if (err != nil) {
            [self showAlert:err.domain with:err.localizedDescription];
        }else{
            [self setmodelData:model];
        }
    }];
}

- (void)setmodelData:(NSMutableArray <Model *> *)model {
    if (modelData != model) {
        modelData = model;
        [self.customTableView reloadData];
    }
}


//MARK: table view delegate and datasource implementation
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableIdentifier = @"custom";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    [cell updateViewWith:modelData[indexPath.row].apiName ands:modelData[indexPath.row].apiDescription];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return modelData.count;
}


@end
