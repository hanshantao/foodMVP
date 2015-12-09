/*
 * Copyright (C) 2015 Olmo Gallegos Hernández.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "GetUsersApiImpl.h"

@implementation GetUsersApiImpl

-(NSArray*) get
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.randomuser.me/"]];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request	 returningResponse:nil error:nil];
    
    NSString *receivedString = [[NSString alloc] initWithData:responseData
                                                     encoding:NSASCIIStringEncoding];
    
    NSLog(@"JSON response:\n%@", receivedString);
    
    NSArray* users = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:NULL][@"results"];
    return users ? users : [NSArray alloc];
}

@end