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

#import "MainPresenterImpl.h"
#import "FoodRepository.h"

@implementation MainPresenterImpl

@synthesize view;
@synthesize repository;

-(void) onListItemClicked:(int)position{
    [view navigateToDetail:position];
}

-(void) onButton1Clicked
{

}

-(void) onButton2Clicked
{
    [view hideLoading];
}

-(void) initWithView:(id<MainView>)theView  andRepository: (id<FoodRepository>) repo
{
    self.view = theView;
    self.repository = repo;
    
    [view showLoading];
    
    [self requestFoodAndUpdateView];
}

-(void) requestFoodAndUpdateView
{
	NSArray* food = [repository get];
    [view onListReceived:food];
}

@end
