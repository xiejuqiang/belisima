//
//  RecordDao.h
//  MainFra
//
//  Created by Tang silence on 13-6-25.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//


#import "DBString.h"

@class FMDatabase;
@interface RecordDao : NSObject{

    FMDatabase *db;
    NSArray *categoryArray;  //分类数据库字段数组
    NSArray *goodsListArray; //商品列表数据库字段数组
    NSArray *addressArray; //地址数据库字段数组
    NSArray *searchArray; //查找数据库字段数组
    
}
-(void)createDB:(NSString *)databaseName;

- (BOOL)insertAtTable:(NSString *)tablename Clos:(NSArray*)clos;
- (BOOL)deleteAtIndex:(NSString *)tableName CloValue:(NSString *)cloValue;
- (BOOL)updateAtTable:(NSString *)tablename Clos:(NSArray *)clos;
- (NSMutableArray *)resultSetWhere:(NSString *)tablename Where:(NSString *)where;
- (NSMutableArray *)resultSet:(NSString *)tableName Order:(NSString *)order LimitCount:(int)limitCount;
@end
