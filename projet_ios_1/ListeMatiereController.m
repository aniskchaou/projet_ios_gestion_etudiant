//
//  ListeMatiereController.m
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "ListeMatiereController.h"
#import "AjouterMatiereController.h"
#import "AfficheController.h"
#import "Matiere.h"
#import "AppDelegate.h"
#import "SpaceCell.h"
@interface ListeMatiereController ()
@property NSInteger notee;
@property NSInteger somme;
@property (strong,nonatomic)NSString* item;
@end

@implementation ListeMatiereController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)forward_ajouter_matiere:(id)sender {
  AjouterMatiereController* liste_mat = [self.storyboard instantiateViewControllerWithIdentifier:@"AjouterMatiereController"];
    
    [self.navigationController pushViewController:liste_mat animated:YES];
}
- (IBAction)calculer_moyenne:(id)sender {
    AfficheController* aff_mat = [self.storyboard instantiateViewControllerWithIdentifier:@"AfficheController"];
   
    [self calculer_somme];
    NSString *str = [NSString stringWithFormat:@"%d", _somme];
    aff_mat.moyenne=str;
    [self.navigationController pushViewController:aff_mat animated:YES];
}


-(NSInteger)calculer_somme
{AppDelegate* appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    for (Matiere* m in appd.listMatiere) {
        
       // NSLog(@"%@",m.nom_mat);
        _item=m.note;
        _notee += _item.intValue;
        
    }
     _somme=_notee/appd.listMatiere.count;
    return _somme;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AppDelegate* appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    return appd.listMatiere.count;
}






-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //static NSString* simpleTableIdentifier = @"SimpleTableItem";
    
    //UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
   /* if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }*/
    AppDelegate* appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    Matiere* mat =  [appd.listMatiere objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = mat.nom_mat;
    
    //UITableViewCell* cell2 = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    static NSString *CellIdentifier = @"SpaceCell";
    SpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                   forIndexPath:indexPath];
    [cell updateCellWithTitle:mat.nom_mat note:mat.note coef:mat.coef];
    //[cell. setText:[NSString stringWithFormat:@"My Cell at Row %ld",(long)indexPath.row]];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
