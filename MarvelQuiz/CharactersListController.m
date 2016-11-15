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
@property (nonatomic) int maxCharactersToRequests;
@property (nonatomic) NetworkManager *networkManager;

@end

@implementation CharactersListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///This Array contains all the Marvel Characters
    self.marvelCharacters = [[NSMutableArray alloc] init];
    
    ///This is the Network Manager
    self.networkManager = [NetworkManager alloc];
    
    #warning should not use a magic number. For the future try to fix this
    ///This is the max number of characters aviable in the Marvel API
    self.maxCharactersToRequests = 1400;

    //Downloading the data
    while(self.networkManager.offset <= self.maxCharactersToRequests) {
        [self getData];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

//Downloading the Data and Parsing
-(void)getData {
    NSLog(@"offset: %d", _networkManager.offset);
    
    //We increase the offset for the next request
    [self.networkManager increaseOffset];
    
    //Making the request
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:self.networkManager.getUrlPath parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        ///This array contains all the downloaded characters for a single request
        NSArray *marvelArray = [[responseObject objectForKey:@"data"] objectForKey:@"results"];
        
        //if the results request isn't empty
        if (marvelArray.count > 0) {
            NSLog(@"request completed... Going for the next one...");
            //for each character
            for(NSDictionary* marvel in marvelArray) {
                //creating a character
                Character *currentMarvelEntity = [[Character alloc] initWithMarvel:marvel];
                //pushing the character into the collection of characters
                [self.marvelCharacters addObject:currentMarvelEntity];
            }
            //Sorting the collection
            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
            NSArray *sortedArray = [self.marvelCharacters sortedArrayUsingDescriptors: [NSArray arrayWithObject:sortDescriptor]];
            self.marvelCharacters =  [sortedArray mutableCopy];
            
            //Reloading the table
            [self.tableView reloadData];
            
        //If the results request is empty
        } else {
            NSLog(@"no more data to download....");
        }

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    

}

#pragma mark - Table view data source

//The number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//The number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.marvelCharacters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //For the cell with identifier = "characterCell"
    static NSString *CellIdentifier = @"characterCell";
    
    //creating a cell
    CharacterCellController *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CharacterCellController alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Popolating the cell
    Character *marvelData = [self.marvelCharacters objectAtIndex:indexPath.row];
    cell.characterNameLabel.text = marvelData.name;
    
    //Done
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
