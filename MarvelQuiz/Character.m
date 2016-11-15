//
//  ParseData.m
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import "Character.h"

@implementation Character

///Creating a Character from a Dictionary
- (id) initWithMarvel:(NSDictionary *)marvelDictionary
{
    if (self = [self init])
    {
        self.name = [marvelDictionary objectForKey:@"name"];
        self.thumbnailImageURL = [NSString stringWithFormat:@"%@.%@",[[marvelDictionary objectForKey:@"thumbnail"] objectForKey:@"path"],[[marvelDictionary objectForKey:@"thumbnail"] objectForKey:@"extension"]];
        self.characterDescription = [marvelDictionary objectForKey:@"description"];
        self.comics = [[NSArray alloc] initWithArray:[[marvelDictionary objectForKey:@"comics"] objectForKey:@"items"]];
        self.events = [[NSArray alloc] initWithArray:[[marvelDictionary objectForKey:@"events"] objectForKey:@"items"]];
        self.series = [[NSArray alloc] initWithArray:[[marvelDictionary objectForKey:@"series"] objectForKey:@"items"]];
        self.stories = [[NSArray alloc] initWithArray:[[marvelDictionary objectForKey:@"stories"] objectForKey:@"items"]];
        self.resourceURL = [marvelDictionary objectForKey:@"resourceURI"];
    }
    return self;
}
@end
