//
//  MDNewEntryViewController.m
//  MyDiary
//
//  Created by Renato Camilio on 2/1/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "MDNewEntryViewController.h"
#import "MDCoreDataStack.h"
#import "MDDiaryEntry.h"

@interface MDNewEntryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryBodyText;

@end

@implementation MDNewEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)insertEntry {
    MDCoreDataStack *coreDataStack = [MDCoreDataStack sharedInstance];
    MDDiaryEntry *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"MDDiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    newEntry.body = self.entryBodyText.text;
    newEntry.date = [[NSDate date] timeIntervalSince1970];
    
    [coreDataStack saveContext];
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneWasPressed:(id)sender {
    [self insertEntry];
    [self dismissSelf];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}


@end
