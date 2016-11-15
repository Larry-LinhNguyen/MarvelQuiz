//
//  CharactersListController.h
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"
#import "AFNetworking.h"

@interface CharactersListController : UITableViewController

@property(nonatomic,strong) NSMutableArray *marvelCharacters;

@end
