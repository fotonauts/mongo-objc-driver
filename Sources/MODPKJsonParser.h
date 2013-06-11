#import <ParseKit/PKSParser.h>

enum {
    MODPKJSON_TOKEN_KIND_COMMATOKEN = 14,
    MODPKJSON_TOKEN_KIND_COLONTOKEN,
    MODPKJSON_TOKEN_KIND_TRUETOKEN,
    MODPKJSON_TOKEN_KIND_MAXKEYTOKEN,
    MODPKJSON_TOKEN_KIND_NULLTOKEN,
    MODPKJSON_TOKEN_KIND_JSNEWTOKEN,
    MODPKJSON_TOKEN_KIND_SYMBOLTOKEN,
    MODPKJSON_TOKEN_KIND_TIMESTAMPTOKEN,
    MODPKJSON_TOKEN_KIND_OBJECTIDTOKEN,
    MODPKJSON_TOKEN_KIND_OPENBRACKETTOKEN,
    MODPKJSON_TOKEN_KIND_DATETOKEN,
    MODPKJSON_TOKEN_KIND_FALSETOKEN,
    MODPKJSON_TOKEN_KIND_BINDATATOKEN,
    MODPKJSON_TOKEN_KIND_CLOSEBRACKETTOKEN,
    MODPKJSON_TOKEN_KIND_MINKEYTOKEN,
    MODPKJSON_TOKEN_KIND_UNDEFINEDTOKEN,
    MODPKJSON_TOKEN_KIND_OPENPARENTHESETOKEN,
    MODPKJSON_TOKEN_KIND_OPENCURLYTOKEN,
    MODPKJSON_TOKEN_KIND_CLOSEPARENTHESETOKEN,
    MODPKJSON_TOKEN_KIND_CLOSECURLYTOKEN,
};

@interface MODPKJsonParser : PKSParser

@end
