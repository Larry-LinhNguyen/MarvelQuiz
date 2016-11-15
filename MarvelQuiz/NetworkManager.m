//
//  NetworkManager.m
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import "NetworkManager.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+MD5.h"

static const NSString *MARVEL_BASE_URL = @"https://gateway.marvel.com/v1/public/";
static const NSString *PUBLIC_KEY = @"a180e24719a54c0abd6fefba9577fe05";
static const NSString *PRIVATE_KEY = @"a48215e2ea333a976e6c14aaba34f97d74a153c6";

@interface NetworkManager ()

@property (nonatomic, copy, readonly) NSString *timeStamp;
@property (nonatomic) NSUInteger timeStampCounter;

@end

@implementation NetworkManager

- (NSString *)timeStamp {
    self.timeStampCounter++;
    return [NSString stringWithFormat:@"%lu", (unsigned long)self.timeStampCounter];
}

- (NSString *)authorizationStringWithPublicKey:(NSString *)ts {
    
    NSString *preHash = [NSString stringWithFormat:@"%@%@%@", ts, PRIVATE_KEY, PUBLIC_KEY];
    
    return [preHash MD5];
}

- (NSString *) getUrlPath {
    // generate timeStamp
    NSString *ts = self.timeStamp;
    //generate authString
    NSString *authString = [self authorizationStringWithPublicKey:ts];
    
    NSString *url = [NSString stringWithFormat:@"%@%@?orderBy=name&ts=%@&apikey=%@&hash=%@", MARVEL_BASE_URL, @"characters", ts, PUBLIC_KEY, authString];
    return url;

}

@end