//
//  HTTPConsts.h
//  CoreData
//
//  Created by James Coughlan on 01/09/2014.
//  Copyright (c) 2014 James Coughlan. All rights reserved.
//
//███████╗ ██████╗ ██████╗ ██╗      ██████╗  ██████╗ ██████╗ ███████╗
//██╔════╝██╔═══██╗██╔══██╗██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
//█████╗  ██║   ██║██████╔╝██║     ██║   ██║██║   ██║██████╔╝███████╗
//██╔══╝  ██║   ██║██╔══██╗██║     ██║   ██║██║   ██║██╔═══╝ ╚════██║
//██║     ╚██████╔╝██║  ██║███████╗╚██████╔╝╚██████╔╝██║     ███████║
//╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝


#pragma mark - Consts
#ifndef YOLO
#define YOLO
//*****consts*****\\//*****HTTP Servers*****
//berrypoststaging.herokuapp.com
const char* ELDERBERRY_DEBUG_HOST = "https://berrypoststaging.herokuapp.com";
const char* ELDERBERRY_PRODUCTION_HOST =  "https://www.gingersnapadventures.com";

const char* ELDERBERRY_HOST =  ""; //set to above

const char* ELDERBERRY_API_VERSION = "v1";
const char* ELDERBERRY_API_PREFIX = "/api/";

const char* EVENTS_SUFFIX = "/events?";
const char* EVENTS_SPECIFIC_SUFFIX = "/events/:id/";

const char* GRANDPARENTS_SUFFIX = "/grandparents?";
const char* GRANDPARENT_SUFFIX = "/grandparent/:id/";

const char* GRANDCHILDREN_SUFFIX = "/grandchildren?";
const char* GRANDCHILDREN_SPECIFIC_SUFFIX = "/grandchildren/";

const char* BADGES_SUFFIX = "/badges?";
const char* FACTFILES_SUFFIX = "/factoids?";
const char* SCRAPBOOK_SUFFIX = "/scrapbook?";

const char* CONNECTIONS_SUFFIX = "/connections?";
const char* CONNECTIONS_SPECIFIC_SUFFIX = "/connections/";

const char* CHILDREN_SUFFIX = "/children?";
const char* CHILDREN_SPECIFIC_SUFFIX = "/children/";

const char* AVATARS_SUFFIX = "/avatars?";
const char* AVATARS_SPECIFIC_SUFFIX = "/avatars/";

const char* PASSWORD_RESET_SUFFIX = "/password_reset?";

const char* SHARE_SUFFIX = "/shares?";
const char* SHARE_SPECIFIC_SUFFIX = "/shares/";

const char* ACTIVITIES__GIFT_SUFFIX = "/activities/gift?";

const char* TEMPLATES_SUFFIX = "/templates?";
const char* TEMPLATES_SPECIFIC_SUFFIX = "/templates/";

const char* ACTIVITIES_SUFFIX = "/activities?";
const char* ACTIVITIES_SPECIFIC_SUFFIX = "/activities/";

const char* PROVISIONAL_USER_SUFFIX = "/provision?";
const char* REGISTER_USER_SUFFIX = "/register?";
const char* LOGIN_USER_SUFFIX = "/login?";
const char* LOGOUT_USER_SUFFIX = "/logout?";

const char* API_KEY = "";

const char* GP_PRODUCTION_KEY = "e9309ada4c42d496ed8bc104a58ce08c";
const char* GP_DEBUG_KEY = "8dd1589a31a6ad9c915470cdd80c294f";
const char* GC_PRODUCTION_KEY = "46ae7a5879e42679d6e78852ed152a4f";
const char* GC_DEBUG_KEY = "2c8f2a4041b08311d83606183525de02";

const char* CHILDS_API_KEY ="";
//PRODUTION KEY:46ae7a5879e42679d6e78852ed152a4f
//DEBUG KEY:2c8f2a4041b08311d83606183525de02
const char* GRANDPARENTS_API_KEY ="";
//PRODUTION KEY:e9309ada4c42d496ed8bc104a58ce08c
//DEBUG KEY:8dd1589a31a6ad9c915470cdd80c294f
const double TIMEOUT = 30.0;

#endif