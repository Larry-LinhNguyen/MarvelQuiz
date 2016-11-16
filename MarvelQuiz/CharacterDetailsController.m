//
//  CharacterDetailsController.m
//  MarvelQuiz
//
//  Created by Andrea Miotto on 16/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import "CharacterDetailsController.h"
#import "UIImageView+AFNetworking.h"

@interface CharacterDetailsController ()

@end

@implementation CharacterDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Setting the name of the character
    self.nameLabel.text = self.character.name;
    
    if ([self.character.characterDescription  isEqual: @""]) {
        self.descriptionLabel.text = @"Missing description for this character...";
    } else {
        self.descriptionLabel.text = self.character.characterDescription;
    }
    
    //Setting the description of the character
    //self.descriptionLabel.text = self.character.characterDescription;
    
    //Setting the image of the cgaracter
#warning this should be async, and the image should be cached
    NSURL *url = [NSURL URLWithString: self.character.thumbnailImageURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    self.imageView.image = image;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
