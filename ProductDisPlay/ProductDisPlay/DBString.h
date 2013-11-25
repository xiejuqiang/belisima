//
//  DBString.h
//  MainFra
//
//  Created by Tang silence on 13-6-25.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//



//数据库名
#define DATABASE_NAME @"bellisima.sqlite"
//分类
#define CATEGORY_TABLENAME @"Category"
#define CATEGORY_CREATE_SQL @"create table if not exists Category (catId Integer primary key,catName text not null,parentId Integer not null,sortOrder Integer not null,content text not null)"



