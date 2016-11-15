//
//  NetworkManager.h
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

@property (nonatomic, copy) NSString *publicKey;
@property (nonatomic, copy) NSString *secretKey;

// Designated initializer
- (NSString *) getUrlPath;

@end
