//
//  CharactersListController.m
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import "CharactersListController.h"
#import "CharacterCellController.h"
#import "NetworkManager.h"

@interface CharactersListController ()

@end

@implementation CharactersListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.marvelCharacters = [[NSMutableArray alloc] init];
    
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

-(void)getData {
    NetworkManager *networkManager = [NetworkManager alloc];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:networkManager.getUrlPath parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self parseResponseData:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    /*
     [manager GET:@"https://gateway.marvel.com/v1/public/characters?ts=1&apikey=da1dad4d3eb6bcf803e0a9af78e6176c&hash=8768e3b957f91dc377a30f8e1b32d158" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
     NSLog(@"JSON: %@", responseObject);
     [self parseResponseData:responseObject];
     } failure:^(NSURLSessionTask *operation, NSError *error) {
     NSLog(@"Error: %@", error);
     }];
     */
}


#pragma mark - Parsing Method

-(void)parseResponseData:(NSDictionary *)responseDictionary {
    NSArray *marvelArray = [[responseDictionary objectForKey:@"data"] objectForKey:@"results"];
    for(NSDictionary* marvel in marvelArray)
    {
        Character *currentMarvelEntity = [[Character alloc] initWithMarvel:marvel];
        NSLog(@"currentMarvelEntity %@", currentMarvelEntity.name);
        [self.marvelCharacters addObject:currentMarvelEntity];
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.marvelCharacters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    static NSString *CellIdentifier = @"characterCell";
    CharacterCellController *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CharacterCellController alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Character *marvelData = [self.marvelCharacters objectAtIndex:indexPath.row];
    cell.characterNameLabel.text = marvelData.name;
    
    /*
    UIImageView *marvelImageView = (UIImageView *)[cell viewWithTag:100];
    [marvelImageView setImageWithURL:[NSURL URLWithString:marvelData.thumbnailImageURL]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     */
    
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
