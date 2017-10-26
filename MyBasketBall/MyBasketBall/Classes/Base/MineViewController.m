//
//  PersonalViewController.m
//  MyBasketBall
//
//  Created by lee on 16/12/16.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MineViewController.h"
#import "MineInfoCell.h"
#import "SDAutoLayout.h"
#import "UIButton+Custom.h"

@interface MineViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UIButton *save;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) UIImageView *portrait;

@end

@implementation MineViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = [NSArray arrayWithObjects:@[@"头像",@"名称",@"生日"]
                           ,@[@"性别",@"身高(cm)",@"体重(kg)",@"所在地"]
                           ,@[@"场上位置",@"球衣号",@"鞋码"], nil];
    
    [self prepareUI];
}

#pragma mark - UI

- (void)prepareUI {

    float height = self.view.bounds.size.height-64;
    
    self.title = @"个人信息";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, height-40) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.rowHeight = 40;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 0.01f)];
    [self.view addSubview:self.tableView];
    
    UIButton *save = [UIButton colorButtonWithTitle:@"确认保存" fontSize:18 titleColor:@"#FFFFFF" backgroundColor:@"#f76672"];
    save.frame = CGRectMake(0, height-40, SCR_W, 40);
    [save addTarget:self action:@selector(savePersonalInfo) forControlEvents:UIControlEventTouchUpInside];
    self.save = save;
    [self.view addSubview:self.save];
}

#pragma mark - tableview datasource and delegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *titleArr = self.titleArray[section];
    return titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *titleArr = self.titleArray[indexPath.section];
    if (indexPath.section == 0 && indexPath.row == 0) {
        UITableViewCell *cell = [self portraitCell];
        return cell;
        
    } else {
        MineInfoCell *cell = [MineInfoCell cellWithTableView:tableView];
        cell.title = titleArr[indexPath.row];
        return cell;
    }
}

- (UITableViewCell *)portraitCell {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"portrait"];
    
    UILabel *title = [UILabel labelWithTitle:@"头像" size:14 colorString:@"#000000"];
    [cell.contentView addSubview:title];
    
    self.portrait = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touxiang"]];
    self.portrait.layer.cornerRadius = 12.5;
    self.portrait.layer.masksToBounds = YES;
    [cell.contentView addSubview:self.portrait];
    
    UIButton *upLoad = [UIButton textButtonWithTitle:@"上传" fontSize:14 titleColor:@"000000"];
    [upLoad addTarget:self action:@selector(upLoadPortrait) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:upLoad];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:line];
    
    title.sd_layout.centerYEqualToView(cell.contentView)
    .leftSpaceToView(cell.contentView, 20)
    .widthIs(80)
    .heightIs(20);
    
    upLoad.sd_layout.centerYEqualToView(cell.contentView)
    .rightSpaceToView(cell.contentView, 20)
    .widthIs(40)
    .heightIs(20);
    
    self.portrait.sd_layout.centerYEqualToView(cell.contentView)
    .rightSpaceToView(upLoad, 20)
    .heightIs(25)
    .widthIs(25);
    
    line.sd_layout.leftEqualToView(cell.contentView)
    .rightEqualToView(cell.contentView)
    .bottomSpaceToView(cell.contentView, 0)
    .heightIs(1);
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - private
     
- (void)upLoadPortrait {
//上传头像
    NSLog(@"upload portrait");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请选择" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancle];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf setPortraitWithSource:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    [alert addAction:album];
    
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //调用相机
        [weakSelf setPortraitWithSource:UIImagePickerControllerSourceTypeCamera];
    }];
    [alert addAction:photo];
    [self presentViewController:alert  animated:YES completion:nil];

}

- (void)setPortraitWithSource:(UIImagePickerControllerSourceType)source {
    
    self.imagePickerController = [UIImagePickerController new];
    self.imagePickerController.allowsEditing = YES;
    self.imagePickerController.sourceType = source;
    self.imagePickerController.delegate = self;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
    
}

- (void)savePersonalInfo {

    NSLog(@"保存成功");
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    // 相册选择完或者拍照完后返回的相片
    UIImage *image  = [info objectForKey:UIImagePickerControllerEditedImage];
    [self.portrait setImage:image];

    [self dismissViewControllerAnimated:YES completion:^{
        //上传头像到服务器
        NSLog(@"头像上传服务器。。。");
    }];
    // 上传完相片清除内存
    image = nil;

}



@end
