//
//  ViewController.m
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "ViewController.h"
#import "ListeMatiereController.h"
#import "InscriptionController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)go:(id)sender {
    NSLog(@"r");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connexion:(id)sender {
    if ([_txt_cin.text isEqualToString:@"admin"]&&[_txt_password.text isEqualToString:@"admin"])
    {
        
        ListeMatiereController* liste_mat = [self.storyboard instantiateViewControllerWithIdentifier:@"ListeMatiereController"];
        
        [self.navigationController pushViewController:liste_mat animated:YES];
    }else
    {
        _lab_msg.text=@"Cin ou Mot de passe est incorrect";
    }
    }


- (IBAction)forward_inscription:(id)sender {
    NSLog(@"r");
    InscriptionController* ins= [self.storyboard instantiateViewControllerWithIdentifier:@"InscriptionController"];
    
    [self.navigationController pushViewController:ins animated:YES];
}

@end
