//
//  ParseData.h
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * thumbnailImageURL;
@property (nonatomic, strong) NSString * characterDescription;
@property (nonatomic, strong) NSArray * comics;
@property (nonatomic, strong) NSArray * events;
@property (nonatomic, strong) NSArray * series;
@property (nonatomic, strong) NSArray * stories;
@property (nonatomic, strong) NSArray * resourceURL;

- (id) initWithMarvel:(NSDictionary *) marvelDictionary;
@end
