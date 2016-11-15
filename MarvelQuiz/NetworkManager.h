//
//  NetworkManager.h
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

@property (nonatomic) int limit;
@property (nonatomic) int offset;


// Designated initializer
- (NSString *) getUrlPath;
- (void) increaseOffset;

@end
