//
//  RecordDao.m
//  MainFra
//
//  Created by Tang silence on 13-6-25.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//

#import "RecordDao.h"
#import "DB.h"

#import "CategoryDBItem.h"
//#import "AddressDBItem.h"

@implementation RecordDao

-(void)initArray
{
    //对应自己数据库字段名 参考DBString.h
    categoryArray = [[NSArray alloc] initWithObjects:@"catId",@"catName",@"parentId",@"sortOrder",@"content", nil];
//    categoryArray = @[@"catId",@"catName",@"content",@"parentId",@"sortOrder"];

}
-(void)createDB:(NSString *)databaseName
{
    db = [[DB alloc] getDatabase:databaseName];
    [self initArray];
}
- (NSArray *)getKeys:(NSString *)tablename
{
    NSArray *keys = nil;
    if([tablename isEqualToString:CATEGORY_TABLENAME] == YES)
    {
        keys = categoryArray;
    }

    
    return keys;
}
- (BOOL)insertAtTable:(NSString *)tablename Clos:(NSArray*)clos
{
    BOOL success = YES;
    NSArray *keys = [self getKeys:tablename];
    int flag = 0;
    NSString *sqlStr = nil;
    NSString *sqlStr1 = [NSString stringWithFormat:@"INSERT INTO %@ (",tablename];
    NSString *sqlStr2 = @") VALUES (";
    for (NSString *key in keys) {
        flag++;
        if(flag == [keys count])
        {
            sqlStr1 = [NSString stringWithFormat:@"%@ %@",sqlStr1,key];
            sqlStr2 = [NSString stringWithFormat:@"%@ ?",sqlStr2];
        }
        else
        {
            sqlStr1 = [NSString stringWithFormat:@"%@ %@,",sqlStr1,key];
            sqlStr2 = [NSString stringWithFormat:@"%@ ?,",sqlStr2];
        }
    }
    sqlStr2 = [NSString stringWithFormat:@"%@)",sqlStr2];
    
    sqlStr = [NSString stringWithFormat:@"%@%@",sqlStr1,sqlStr2];
    
    NSLog(@"sqlStr %@/n sqlStr2 %@",sqlStr,sqlStr2);
    NSLog(@"clos %@",clos);
    NSLog(@"%d",[clos count]);
    [db executeUpdate:sqlStr withArgumentsInArray:clos];
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
    return success;
}
- (BOOL)deleteAtIndex:(NSString *)tableName CloValue:(NSString *)cloValue
{
    BOOL success = YES;
    NSArray *keys = nil;
    NSString *sqlStr;
    if([tableName isEqualToString:CATEGORY_TABLENAME] == YES)
    {
        keys = categoryArray;
    }
    if(cloValue == nil)
    {
        sqlStr = [NSString stringWithFormat:@"DELETE FROM %@ WHERE 1==1",tableName];
    }
    else
    {
        sqlStr = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?",tableName,[keys objectAtIndex:0]];
    }
    
    [db executeUpdate:sqlStr,cloValue];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}
- (BOOL)updateAtTable:(NSString *)tablename Clos:(NSArray *)clos
{
    BOOL success = YES;
    NSArray *keys = nil;
    if([tablename isEqualToString:CATEGORY_TABLENAME] == YES)
    {
        keys = categoryArray;
        
        int flag = 0;
        NSString *sqlStr = nil;
        NSString *sqlStr1 = [NSString stringWithFormat:@"UPDATE %@ SET",tablename];
        NSString *sqlStr2 = [NSString stringWithFormat:@"WHERE %@=? AND %@=?",[keys objectAtIndex:0],[keys objectAtIndex:1]];
        for (NSString *key in keys) {
            flag++;
            if(flag == 1)
            {
                continue;
            }
            else if(flag == [keys count])
            {
                sqlStr1 = [NSString stringWithFormat:@"%@ %@=?",sqlStr1,key];
            }
            else
            {
                sqlStr1 = [NSString stringWithFormat:@"%@ %@=?,",sqlStr1,key];
            }
        }
        sqlStr = [NSString stringWithFormat:@"%@ %@",sqlStr1,sqlStr2];
        
        [db executeUpdate:sqlStr withArgumentsInArray:clos];
        if ([db hadError]) {
            NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
            success = NO;
        }
    }
    return success;
}
- (NSMutableArray *)resultSetWhere:(NSString *)tableName Where:(NSString *)where
{
    FMResultSet *rs = nil;
    rs=[db executeQuery:where];
    return [self rsToItem:rs TableName:tableName];
}
- (NSMutableArray *)resultSet:(NSString *)tableName Order:(NSString *)order LimitCount:(int)limitCount
{
    FMResultSet *rs = nil;
    if(limitCount != 0 && order != nil)
    {
        rs = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY %@ DESC LIMIT %d",tableName,order,limitCount]];
    }
    else if(order == nil && limitCount == 0)
    {
        rs = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@",tableName]];
    }
    else if(order != nil)
    {
        rs = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY %@",tableName,order]];
    }
    else if(limitCount != 0)
    {
        rs = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ LIMIT %d",tableName,limitCount]];
    }
    
    return [self rsToItem:rs TableName:tableName];
}
- (NSMutableArray *)rsToItem:(FMResultSet *)rs TableName:(NSString *)tableName
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray *returnArray = nil;
    if([tableName isEqualToString:CATEGORY_TABLENAME]==YES)
    {
        while ([rs next])
        {
            returnArray = [[NSArray alloc]initWithObjects:[rs stringForColumn:[rs columnNameForIndex:0]],[rs stringForColumn:[rs columnNameForIndex:1]],[rs stringForColumn:[rs columnNameForIndex:2]],[rs stringForColumn:[rs columnNameForIndex:3]],[rs stringForColumn:[rs columnNameForIndex:4]],nil];
            CategoryDBItem *categoryDBItem = [[CategoryDBItem alloc]init];
            [categoryDBItem initData:returnArray];
            [result addObject:categoryDBItem];
        }
    }

   
    return result;
}
@end
