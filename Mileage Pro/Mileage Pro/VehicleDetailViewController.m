//
//  VehicleDetailViewController.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/6/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "VehicleDetailViewController.h"
#import "VehicleStore.h"
#import "Vehicle.h"
#import "VehicleImageStore.h"

@interface VehicleDetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *makeField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *colorField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation VehicleDetailViewController

- (instancetype)initForNewVehicle:(BOOL)isNew
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        if (isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            self.navigationItem.rightBarButtonItem = doneItem;
            
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            self.navigationItem.leftBarButtonItem = cancelItem;
        }
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    [NSException raise:@"Wrong initializer" format:@"Use initForNewItem:"];
    return nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    Vehicle *vehicle = self.vehicle;
    
    self.nameField.text = vehicle.name;
    self.makeField.text = vehicle.make;
    self.modelField.text = vehicle.model;
    self.colorField.text = vehicle.color;
    self.yearField.text = [NSString stringWithFormat:@"%d", vehicle.year];
    
    NSString *vehicleKey = self.vehicle.vehicleKey;
    
    UIImage *imageToDisplay = [[VehicleImageStore sharedStore] imageForKey:vehicleKey];
    
    self.imageView.image = imageToDisplay;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    Vehicle *vehicle = self.vehicle;
    vehicle.name = self.nameField.text;
    vehicle.make = self.makeField.text;
    vehicle.model = self.modelField.text;
    vehicle.color = self.colorField.text;
    vehicle.year = [self.yearField.text intValue];
}

- (void)save:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (void)cancel:(id)sender
{
    [[VehicleStore sharedStore] deleteVehicle:self.vehicle];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];

    [[VehicleImageStore sharedStore] setImage:image forKey:self.vehicle.vehicleKey];
    
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

@end
