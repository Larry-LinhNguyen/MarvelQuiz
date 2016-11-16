//
//  CharacterDetailsController.h
//  MarvelQuiz
//
//  Created by Andrea Miotto on 16/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import "ViewController.h"
#import "Character.h"

@interface CharacterDetailsController : ViewController

@property (nonatomic, strong) Character * character;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@end
