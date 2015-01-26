//
//  GSThreadSafeManagedObject.h
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "IAThreadSafeManagedObject.h"
#import "IAThreadSafeContext.h"
typedef void (^ObjectAddedCompletionBlock)(IAThreadSafeManagedObject* object);

@interface GSThreadSafeManagedObject : IAThreadSafeManagedObject



@end
