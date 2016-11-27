//
//  AjouterMatiereController.m
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "AjouterMatiereController.h"
#import "ListeMatiereController.h"
#import "AppDelegate.h"
#import "Matiere.h"
@interface AjouterMatiereController ()

@end

@implementation AjouterMatiereController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ajouter_matiere:(id)sender {
 
    
    Matiere* mat = [[Matiere alloc] initMatiereWithName:_txt_ajout_nom.text withCoef:_txt_ajout_coeff.text withNote:_txt_ajout_note.text];

    
    AppDelegate* appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    
    [mat addMatiereToList:appd.listMatiere];
    //NSLog(@"sdf");
    
    ListeMatiereController* liste_mat = [self.storyboard instantiateViewControllerWithIdentifier:@"ListeMatiereController"];
    
    [self.navigationController pushViewController:liste_mat animated:YES];
    
    
    
   
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
