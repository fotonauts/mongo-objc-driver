
#line 1 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
//
//  MODRagelJsonParser.m
//  mongo-objc-driver
//
//  Created by Jérôme Lebel on 01/09/13.
//
//

#import "MODRagelJsonParser.h"
#import "MODSortedMutableDictionary.h"
#import "MODMaxKey.h"
#import "MODMinKey.h"
#import "MODUndefined.h"
#import "MODObjectId.h"
#import "MODRegex.h"
#import "MOD_internal.h"
#import "MODBinary.h"
#import "MODTimestamp.h"
#import "MODSymbol.h"
#import "NSString+Base64.h"

@interface MODRagelJsonParser ()
@property (nonatomic, strong, readwrite) NSError *error;

@end

@implementation MODRagelJsonParser (private)

+ (void)bsonFromJson:(bson *)bsonResult json:(NSString *)json error:(NSError **)error
{
    id object = [self objectsFromJson:json withError:error];
    
    if (object && !*error && [object isKindOfClass:NSArray.class]) {
        object = [MODSortedMutableDictionary sortedDictionaryWithObject:object forKey:@"array"];
    }
    if (object && !*error && [object isKindOfClass:MODSortedMutableDictionary.class]) {
        [MODServer appendObject:object toBson:bsonResult];
    }
}

@end

@implementation MODRagelJsonParser

@synthesize error = _error;

+ (id)objectsFromJson:(NSString *)source withError:(NSError **)error
{
    MODRagelJsonParser *parser = [[self alloc] init];
    id result;
    
    result = [parser parseJson:source withError:error];
    [parser release];
    return result;
}

- (void)_makeErrorWithMessage:(NSString *)message atPosition:(const char *)position
{
    if (!self.error) {
        NSUInteger length;
        
        length = strlen(position);
        if (length > 10) {
            length = 10;
        }
        self.error = [NSError errorWithDomain:@"error" code:0 userInfo:@{ NSLocalizedDescriptionKey: [NSString stringWithFormat:@"%@: \"%@\"", message, [[[NSString alloc] initWithBytes:position length:length encoding:NSUTF8StringEncoding] autorelease]] }];
    }
}


#line 103 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"



#line 78 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_value_actions[] = {
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 1, 12, 1, 13, 1, 14, 1, 
	15, 1, 16, 1, 17
};

static const char _JSON_value_key_offsets[] = {
	0, 0, 18, 20, 21, 22, 23, 24, 
	25, 26, 27, 28, 29, 30, 31, 32, 
	34, 35, 36, 37, 38, 39, 40, 41, 
	42, 43, 44, 45, 46, 47, 48
};

static const char _JSON_value_trans_keys[] = {
	34, 39, 45, 47, 66, 77, 78, 79, 
	83, 84, 91, 102, 110, 116, 117, 123, 
	48, 57, 97, 105, 120, 75, 101, 121, 
	110, 75, 101, 121, 97, 108, 115, 101, 
	101, 117, 119, 108, 108, 114, 117, 101, 
	110, 100, 101, 102, 105, 110, 101, 100, 
	0
};

static const char _JSON_value_single_lengths[] = {
	0, 16, 2, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 2, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 0
};

static const char _JSON_value_range_lengths[] = {
	0, 1, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0
};

static const char _JSON_value_index_offsets[] = {
	0, 0, 18, 21, 23, 25, 27, 29, 
	31, 33, 35, 37, 39, 41, 43, 45, 
	48, 50, 52, 54, 56, 58, 60, 62, 
	64, 66, 68, 70, 72, 74, 76
};

static const char _JSON_value_trans_targs[] = {
	30, 30, 30, 30, 30, 2, 30, 30, 
	30, 30, 30, 11, 15, 19, 22, 30, 
	30, 0, 3, 7, 0, 4, 0, 5, 
	0, 6, 0, 30, 0, 8, 0, 9, 
	0, 10, 0, 30, 0, 12, 0, 13, 
	0, 14, 0, 30, 0, 16, 17, 0, 
	30, 0, 18, 0, 30, 0, 20, 0, 
	21, 0, 30, 0, 23, 0, 24, 0, 
	25, 0, 26, 0, 27, 0, 28, 0, 
	29, 0, 30, 0, 0, 0
};

static const char _JSON_value_trans_actions[] = {
	15, 15, 17, 23, 29, 0, 25, 13, 
	31, 27, 19, 0, 0, 0, 0, 21, 
	17, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 9, 0, 0, 0, 0, 
	0, 0, 0, 7, 0, 0, 0, 0, 
	0, 0, 0, 3, 0, 0, 0, 0, 
	33, 0, 0, 0, 1, 0, 0, 0, 
	0, 0, 5, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 11, 0, 0, 0
};

static const char _JSON_value_from_state_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 35
};

static const int JSON_value_start = 1;
static const int JSON_value_first_final = 30;
static const int JSON_value_error = 0;

static const int JSON_value_en_main = 1;


#line 231 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseValueWithPointer:(const char *)p endPointer:(const char *)pe result:(id *)result
{
    int cs = 0;

    
#line 173 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_value_start;
	}

#line 238 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 180 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_acts = _JSON_value_actions + _JSON_value_from_state_actions[cs];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 ) {
		switch ( *_acts++ ) {
	case 17:
#line 210 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 201 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

	_keys = _JSON_value_trans_keys + _JSON_value_key_offsets[cs];
	_trans = _JSON_value_index_offsets[cs];

	_klen = _JSON_value_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_value_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	cs = _JSON_value_trans_targs[_trans];

	if ( _JSON_value_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_value_actions + _JSON_value_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 111 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        *result = [NSNull null];
    }
	break;
	case 1:
#line 114 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        *result = [NSNumber numberWithBool:NO];
    }
	break;
	case 2:
#line 117 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        *result = [NSNumber numberWithBool:YES];
    }
	break;
	case 3:
#line 121 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        *result = [[[MODMinKey alloc] init] autorelease];
    }
	break;
	case 4:
#line 125 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        *result = [[[MODMaxKey alloc] init] autorelease];
    }
	break;
	case 5:
#line 129 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        *result = [[[MODUndefined alloc] init] autorelease];
    }
	break;
	case 6:
#line 133 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseObjectIdWithPointer:p endPointer:pe result:result];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 7:
#line 138 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseStringWithPointer:p endPointer:pe result:result];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 8:
#line 143 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseFloatWithPointer:p endPointer:pe result:result];
        if (np != NULL) {p = (( np))-1;}
        np = [self _parseIntegerWithPointer:p endPointer:pe result:result];
        if (np != NULL) {p = (( np))-1;}
        p--; {p++; goto _out; }
    }
	break;
	case 9:
#line 152 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        _currentNesting++;
        np = [self _parseArrayWithPointer:p endPointer:pe result:result];
        _currentNesting--;
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 10:
#line 160 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        _currentNesting++;
        np = [self _parseObjectWithPointer:p endPointer:pe result:result];
        _currentNesting--;
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 11:
#line 168 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseRegexpWithPointer:p endPointer:pe result:result];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 12:
#line 173 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseNumberLongWithPointer:p endPointer:pe result:result];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 13:
#line 178 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseTimestampWithPointer:p endPointer:pe result:result];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 14:
#line 183 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseBinDataWithPointer:p endPointer:pe result:result];
        if (np == NULL) {
            p--; {p++; goto _out; }
        } else {
            {p = (( np))-1;}
        }
    }
	break;
	case 15:
#line 192 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseSymbolWithPointer:p endPointer:pe result:result];
        if (np == NULL) {
            p--; {p++; goto _out; }
        } else {
            {p = (( np))-1;}
        }
    }
	break;
	case 16:
#line 201 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np = [self _parseJavascriptObjectWithPointer:p - 2 endPointer:pe result:result];
        if (np == NULL) {
            p--; {p++; goto _out; }
        } else {
            {p = (( np))-1;}
        }
    }
	break;
#line 400 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 239 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"

    if (*result == nil || cs < JSON_value_first_final) {
        [self _makeErrorWithMessage:@"cannot parse value" atPosition:p];
        return NULL;
    } else {
        return p;
    }
}


#line 424 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_integer_actions[] = {
	0, 1, 0
};

static const char _JSON_integer_key_offsets[] = {
	0, 0, 4, 7, 9, 9
};

static const char _JSON_integer_trans_keys[] = {
	45, 48, 49, 57, 48, 49, 57, 48, 
	57, 48, 57, 0
};

static const char _JSON_integer_single_lengths[] = {
	0, 2, 1, 0, 0, 0
};

static const char _JSON_integer_range_lengths[] = {
	0, 1, 1, 1, 0, 1
};

static const char _JSON_integer_index_offsets[] = {
	0, 0, 4, 7, 9, 10
};

static const char _JSON_integer_indicies[] = {
	0, 2, 3, 1, 2, 3, 1, 1, 
	4, 1, 3, 4, 0
};

static const char _JSON_integer_trans_targs[] = {
	2, 0, 3, 5, 4
};

static const char _JSON_integer_trans_actions[] = {
	0, 0, 0, 0, 1
};

static const int JSON_integer_start = 1;
static const int JSON_integer_first_final = 3;
static const int JSON_integer_error = 0;

static const int JSON_integer_en_main = 1;


#line 256 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseIntegerWithPointer:(const char *)p endPointer:(const char *)pe result:(NSNumber **)result
{
    int cs = 0;
    const char *memo;

    
#line 479 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_integer_start;
	}

#line 264 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    memo = p;
    
#line 487 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_integer_trans_keys + _JSON_integer_key_offsets[cs];
	_trans = _JSON_integer_index_offsets[cs];

	_klen = _JSON_integer_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_integer_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_integer_indicies[_trans];
	cs = _JSON_integer_trans_targs[_trans];

	if ( _JSON_integer_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_integer_actions + _JSON_integer_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 253 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 565 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 266 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"

    if (cs >= JSON_integer_first_final) {
        NSString *buffer;
        
        buffer = [[NSString alloc] initWithBytesNoCopy:(void *)memo length:p - memo encoding:NSUTF8StringEncoding freeWhenDone:NO];
        if (buffer.longLongValue > INT_MAX || buffer.longLongValue < INT_MIN) {
            *result = [NSNumber numberWithLongLong:buffer.longLongValue];
        } else {
            *result = [NSNumber numberWithInt:buffer.intValue];
        }
        [buffer release];
        return p + 1;
    } else {
        return NULL;
    }
}


#line 597 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_float_actions[] = {
	0, 1, 0
};

static const char _JSON_float_key_offsets[] = {
	0, 0, 4, 7, 10, 12, 16, 18, 
	23, 29, 29
};

static const char _JSON_float_trans_keys[] = {
	45, 48, 49, 57, 48, 49, 57, 46, 
	69, 101, 48, 57, 43, 45, 48, 57, 
	48, 57, 46, 69, 101, 48, 57, 69, 
	101, 45, 46, 48, 57, 69, 101, 45, 
	46, 48, 57, 0
};

static const char _JSON_float_single_lengths[] = {
	0, 2, 1, 3, 0, 2, 0, 3, 
	2, 0, 2
};

static const char _JSON_float_range_lengths[] = {
	0, 1, 1, 0, 1, 1, 1, 1, 
	2, 0, 2
};

static const char _JSON_float_index_offsets[] = {
	0, 0, 4, 7, 11, 13, 17, 19, 
	24, 29, 30
};

static const char _JSON_float_indicies[] = {
	0, 2, 3, 1, 2, 3, 1, 4, 
	5, 5, 1, 6, 1, 7, 7, 8, 
	1, 8, 1, 4, 5, 5, 3, 1, 
	5, 5, 1, 6, 9, 1, 1, 1, 
	1, 8, 9, 0
};

static const char _JSON_float_trans_targs[] = {
	2, 0, 3, 7, 4, 5, 8, 6, 
	10, 9
};

static const char _JSON_float_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 1
};

static const int JSON_float_start = 1;
static const int JSON_float_first_final = 8;
static const int JSON_float_error = 0;

static const int JSON_float_en_main = 1;


#line 295 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseFloatWithPointer:(const char *)p endPointer:(const char *)pe result:(NSNumber **)result
{
    int cs = 0;
    const char *memo;

    
#line 664 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_float_start;
	}

#line 303 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    memo = p;
    
#line 672 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_float_trans_keys + _JSON_float_key_offsets[cs];
	_trans = _JSON_float_index_offsets[cs];

	_klen = _JSON_float_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_float_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_float_indicies[_trans];
	cs = _JSON_float_trans_targs[_trans];

	if ( _JSON_float_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_float_actions + _JSON_float_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 289 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 750 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 305 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"

    if (cs >= JSON_float_first_final) {
        NSUInteger length = p - memo;
        char *buffer;
        double value;
        
        buffer = malloc(length + 1);
        strncpy(buffer, memo, length);
        sscanf(buffer, "%lf", &value);
        *result = [NSNumber numberWithDouble:value];
        free(buffer);
        return p + 1;
    } else {
        return NULL;
    }
}


#line 782 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_object_actions[] = {
	0, 1, 0, 1, 1, 1, 2
};

static const char _JSON_object_key_offsets[] = {
	0, 0, 1, 8, 13, 34, 40, 46
};

static const char _JSON_object_trans_keys[] = {
	123, 13, 32, 34, 39, 125, 9, 10, 
	13, 32, 58, 9, 10, 13, 32, 34, 
	39, 45, 66, 73, 91, 102, 110, 123, 
	9, 10, 47, 57, 77, 79, 83, 84, 
	116, 117, 13, 32, 44, 125, 9, 10, 
	13, 32, 34, 39, 9, 10, 0
};

static const char _JSON_object_single_lengths[] = {
	0, 1, 5, 3, 11, 4, 4, 0
};

static const char _JSON_object_range_lengths[] = {
	0, 0, 1, 1, 5, 1, 1, 0
};

static const char _JSON_object_index_offsets[] = {
	0, 0, 2, 9, 14, 31, 37, 43
};

static const char _JSON_object_indicies[] = {
	0, 1, 0, 0, 2, 2, 3, 0, 
	1, 4, 4, 5, 4, 1, 5, 5, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	6, 5, 6, 6, 6, 6, 1, 7, 
	7, 8, 3, 7, 1, 8, 8, 2, 
	2, 8, 1, 1, 0
};

static const char _JSON_object_trans_targs[] = {
	2, 0, 3, 7, 3, 4, 5, 5, 
	6
};

static const char _JSON_object_trans_actions[] = {
	0, 0, 3, 5, 0, 0, 1, 0, 
	0
};

static const int JSON_object_start = 1;
static const int JSON_object_first_final = 7;
static const int JSON_object_error = 0;

static const int JSON_object_en_main = 1;


#line 355 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseObjectWithPointer:(const char *)p endPointer:(const char *)pe result:(MODSortedMutableDictionary **)result
{
    int cs = 0;
    NSString *lastName;
    
    if (_maxNesting && _currentNesting > _maxNesting) {
        [NSException raise:@"NestingError" format:@"nesting of %d is too deep", _currentNesting];
    }
    
    *result = [[MODSortedMutableDictionary alloc] init];
    
    
#line 853 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_object_start;
	}

#line 369 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 860 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_object_trans_keys + _JSON_object_key_offsets[cs];
	_trans = _JSON_object_index_offsets[cs];

	_klen = _JSON_object_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_object_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_object_indicies[_trans];
	cs = _JSON_object_trans_targs[_trans];

	if ( _JSON_object_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_object_actions + _JSON_object_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 328 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        id value = nil;
        const char *np = [self _parseValueWithPointer:p endPointer:pe result:&value];
        if (np == NULL) {
            p--; {p++; goto _out; }
        } else {
            [*result setObject:value forKey:lastName];
            {p = (( np))-1;}
        }
    }
	break;
	case 1:
#line 339 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseStringWithPointer:p endPointer:pe result:&lastName];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 2:
#line 345 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 959 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 370 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
    if (cs >= JSON_object_first_final) {
        MODSortedMutableDictionary *tengen;
        
        tengen = [*result tengenJsonEncodedObject];
        if (tengen) {
            [*result release];
            *result = tengen;
        } else {
            [*result autorelease];
        }
        return p + 1;
    } else {
        [*result release];
        *result = nil;
        return NULL;
    }
}


#line 993 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_javascript_object_actions[] = {
	0, 1, 0, 1, 1, 1, 2
};

static const char _JSON_javascript_object_key_offsets[] = {
	0, 0, 2, 3, 4, 5, 6, 7, 
	8, 13, 19, 24, 25, 26, 31, 32, 
	33, 34, 39, 49, 50, 56, 63
};

static const char _JSON_javascript_object_trans_keys[] = {
	73, 110, 83, 79, 68, 97, 116, 101, 
	13, 32, 40, 9, 10, 13, 32, 34, 
	39, 9, 10, 13, 32, 41, 9, 10, 
	101, 119, 13, 32, 68, 9, 10, 97, 
	116, 101, 13, 32, 40, 9, 10, 13, 
	32, 34, 39, 41, 45, 9, 10, 48, 
	57, 41, 13, 32, 41, 44, 9, 10, 
	13, 32, 45, 9, 10, 48, 57, 0
};

static const char _JSON_javascript_object_single_lengths[] = {
	0, 2, 1, 1, 1, 1, 1, 1, 
	3, 4, 3, 1, 1, 3, 1, 1, 
	1, 3, 6, 1, 4, 3, 0
};

static const char _JSON_javascript_object_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 1, 1, 0, 0, 1, 0, 0, 
	0, 1, 2, 0, 1, 2, 0
};

static const char _JSON_javascript_object_index_offsets[] = {
	0, 0, 3, 5, 7, 9, 11, 13, 
	15, 20, 26, 31, 33, 35, 40, 42, 
	44, 46, 51, 60, 62, 68, 74
};

static const char _JSON_javascript_object_indicies[] = {
	0, 2, 1, 3, 1, 4, 1, 5, 
	1, 6, 1, 7, 1, 8, 1, 8, 
	8, 9, 8, 1, 9, 9, 10, 10, 
	9, 1, 11, 11, 12, 11, 1, 13, 
	1, 14, 1, 14, 14, 15, 14, 1, 
	16, 1, 17, 1, 18, 1, 18, 18, 
	19, 18, 1, 19, 19, 20, 20, 12, 
	21, 19, 21, 1, 12, 1, 22, 22, 
	12, 23, 22, 1, 23, 23, 21, 23, 
	21, 1, 1, 0
};

static const char _JSON_javascript_object_trans_targs[] = {
	2, 0, 11, 3, 4, 5, 6, 7, 
	8, 9, 10, 10, 22, 12, 13, 14, 
	15, 16, 17, 18, 19, 20, 20, 21
};

static const char _JSON_javascript_object_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 3, 0, 5, 0, 0, 0, 
	0, 0, 0, 0, 3, 1, 0, 0
};

static const int JSON_javascript_object_start = 1;
static const int JSON_javascript_object_first_final = 22;
static const int JSON_javascript_object_error = 0;

static const int JSON_javascript_object_en_main = 1;


#line 430 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseJavascriptObjectWithPointer:(const char *)p endPointer:(const char *)pe result:(id *)result
{
    int cs = 0;
    NSMutableArray *parameters = [[NSMutableArray alloc] init];

    
#line 1074 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_javascript_object_start;
	}

#line 438 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 1081 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_javascript_object_trans_keys + _JSON_javascript_object_key_offsets[cs];
	_trans = _JSON_javascript_object_index_offsets[cs];

	_klen = _JSON_javascript_object_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_javascript_object_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_javascript_object_indicies[_trans];
	cs = _JSON_javascript_object_trans_targs[_trans];

	if ( _JSON_javascript_object_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_javascript_object_actions + _JSON_javascript_object_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 395 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        NSNumber *number;
        
        np = [self _parseIntegerWithPointer:p endPointer:pe result:&number];
        if (np != NULL && number) {
            [parameters addObject:number];
            np--; {p = (( np))-1;}
        } else {
            p--; {p++; goto _out; }
        }
    }
	break;
	case 1:
#line 408 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        NSString *string = nil;
        
        np = [self _parseStringWithPointer:p endPointer:pe result:&string];
        if (np != NULL && string) {
            [parameters addObject:string];
            {p = (( np))-1;}
        } else {
            p--; {p++; goto _out; }
        }
    }
	break;
	case 2:
#line 421 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 1189 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 439 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"

    if (cs >= JSON_javascript_object_first_final) {
        if (parameters.count == 1 && [[parameters objectAtIndex:0] isKindOfClass:NSString.class]) {
            NSDateFormatter *formater;
            
            formater = [[NSDateFormatter alloc] init];
            [formater setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
            *result = [[[formater dateFromString:[parameters objectAtIndex:0]] retain] autorelease];
            [formater autorelease];
        } else if (parameters.count == 1 && [[parameters objectAtIndex:0] isKindOfClass:NSNumber.class]) {
            *result = [NSDate dateWithTimeIntervalSince1970:[[parameters objectAtIndex:0] doubleValue] / 1000.0];
        }
    } else {
        *result = nil;
    }
    [parameters release];
    if (*result) {
        return p + 1;
    } else {
        [self _makeErrorWithMessage:@"cannot parse javascript object" atPosition:p];
        return NULL;
    }
}


#line 1228 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_bin_data_actions[] = {
	0, 1, 0, 1, 1, 1, 2
};

static const char _JSON_bin_data_key_offsets[] = {
	0, 0, 1, 2, 3, 4, 5, 6, 
	7, 12, 19, 24, 30, 35
};

static const char _JSON_bin_data_trans_keys[] = {
	66, 105, 110, 68, 97, 116, 97, 13, 
	32, 40, 9, 10, 13, 32, 45, 9, 
	10, 48, 57, 13, 32, 44, 9, 10, 
	13, 32, 34, 39, 9, 10, 13, 32, 
	41, 9, 10, 0
};

static const char _JSON_bin_data_single_lengths[] = {
	0, 1, 1, 1, 1, 1, 1, 1, 
	3, 3, 3, 4, 3, 0
};

static const char _JSON_bin_data_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 2, 1, 1, 1, 0
};

static const char _JSON_bin_data_index_offsets[] = {
	0, 0, 2, 4, 6, 8, 10, 12, 
	14, 19, 25, 30, 36, 41
};

static const char _JSON_bin_data_indicies[] = {
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 7, 1, 7, 7, 
	8, 7, 1, 8, 8, 9, 8, 9, 
	1, 10, 10, 11, 10, 1, 11, 11, 
	12, 12, 11, 1, 13, 13, 14, 13, 
	1, 1, 0
};

static const char _JSON_bin_data_trans_targs[] = {
	2, 0, 3, 4, 5, 6, 7, 8, 
	9, 10, 10, 11, 12, 12, 13
};

static const char _JSON_bin_data_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 3, 0, 0, 1, 0, 5
};

static const int JSON_bin_data_start = 1;
static const int JSON_bin_data_first_final = 13;
static const int JSON_bin_data_error = 0;

static const int JSON_bin_data_en_main = 1;


#line 484 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseBinDataWithPointer:(const char *)p endPointer:(const char *)pe result:(MODBinary **)result
{
    NSString *dataStringValue = nil;
    NSNumber *typeValue = nil;
    NSData *dataValue = nil;
    int cs = 0;

    
#line 1298 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_bin_data_start;
	}

#line 494 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 1305 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_bin_data_trans_keys + _JSON_bin_data_key_offsets[cs];
	_trans = _JSON_bin_data_index_offsets[cs];

	_klen = _JSON_bin_data_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_bin_data_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_bin_data_indicies[_trans];
	cs = _JSON_bin_data_trans_targs[_trans];

	if ( _JSON_bin_data_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_bin_data_actions + _JSON_bin_data_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 469 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseStringWithPointer:p endPointer:pe result:&dataStringValue];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 1:
#line 475 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseIntegerWithPointer:p endPointer:pe result:&typeValue];
        if (np == NULL) { p--; {p++; goto _out; } } else { np--; {p = (( np))-1;} }
    }
	break;
	case 2:
#line 481 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 1399 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 495 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"

    dataValue = [dataStringValue dataFromBase64];
    if (cs >= JSON_bin_data_first_final && dataValue && [MODBinary isValidDataType:typeValue.unsignedCharValue] ) {
        *result = [[[MODBinary alloc] initWithData:dataValue binaryType:typeValue.unsignedCharValue] autorelease];
        return p + 1;
    } else {
        *result = nil;
        return NULL;
    }
}


#line 1425 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_object_id_actions[] = {
	0, 1, 0, 1, 1
};

static const char _JSON_object_id_key_offsets[] = {
	0, 0, 1, 2, 3, 4, 5, 6, 
	7, 8, 13, 19, 24
};

static const char _JSON_object_id_trans_keys[] = {
	79, 98, 106, 101, 99, 116, 73, 100, 
	13, 32, 40, 9, 10, 13, 32, 34, 
	39, 9, 10, 13, 32, 41, 9, 10, 
	0
};

static const char _JSON_object_id_single_lengths[] = {
	0, 1, 1, 1, 1, 1, 1, 1, 
	1, 3, 4, 3, 0
};

static const char _JSON_object_id_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 1, 1, 1, 0
};

static const char _JSON_object_id_index_offsets[] = {
	0, 0, 2, 4, 6, 8, 10, 12, 
	14, 16, 21, 27, 32
};

static const char _JSON_object_id_indicies[] = {
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 7, 1, 8, 1, 
	8, 8, 9, 8, 1, 9, 9, 10, 
	10, 9, 1, 11, 11, 12, 11, 1, 
	1, 0
};

static const char _JSON_object_id_trans_targs[] = {
	2, 0, 3, 4, 5, 6, 7, 8, 
	9, 10, 11, 11, 12
};

static const char _JSON_object_id_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 0, 3
};

static const int JSON_object_id_start = 1;
static const int JSON_object_id_first_final = 12;
static const int JSON_object_id_error = 0;

static const int JSON_object_id_en_main = 1;


#line 521 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseObjectIdWithPointer:(const char *)p endPointer:(const char *)pe result:(MODObjectId **)result
{
    NSString *idStringValue = nil;
    int cs = 0;

    
#line 1491 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_object_id_start;
	}

#line 529 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 1498 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_object_id_trans_keys + _JSON_object_id_key_offsets[cs];
	_trans = _JSON_object_id_index_offsets[cs];

	_klen = _JSON_object_id_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_object_id_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_object_id_indicies[_trans];
	cs = _JSON_object_id_trans_targs[_trans];

	if ( _JSON_object_id_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_object_id_actions + _JSON_object_id_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 512 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseStringWithPointer:p endPointer:pe result:&idStringValue];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 1:
#line 518 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 1584 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 530 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"

    if (cs >= JSON_object_id_first_final && [MODObjectId isStringValid:idStringValue]) {
        *result = [[[MODObjectId alloc] initWithString:idStringValue] autorelease];
        return p + 1;
    } else {
        *result = nil;
        return NULL;
    }
}

- (const char *)_parseRegexpWithPointer:(const char *)string endPointer:(const char *)stringEnd result:(MODRegex **)result
{
    const char *bookmark, *cursor;
    BOOL backslashJustBefore = NO;
    
    cursor = string + 1;
    bookmark = cursor;
    while (cursor < stringEnd && *cursor != '/' && !backslashJustBefore) {
        if (*cursor == '\\') {
            backslashJustBefore = YES;
        } else {
            backslashJustBefore = NO;
        }
        cursor++;
    }
    if (*cursor == '/') {
        NSString *buffer;
        NSString *options;
        
        buffer = [[NSString alloc] initWithBytesNoCopy:(void *)bookmark length:cursor - bookmark encoding:NSUTF8StringEncoding freeWhenDone:NO];
        cursor++;
        
        bookmark = cursor;
        while (cursor < stringEnd && strchr("imsx", *cursor) != NULL) {
            cursor++;
        }
        options = [[NSString alloc] initWithBytesNoCopy:(void *)bookmark length:cursor - bookmark encoding:NSUTF8StringEncoding freeWhenDone:NO];
        
        *result = [[[MODRegex alloc] initWithPattern:buffer options:options] autorelease];
        [buffer release];
        [options release];
    } else {
        cursor = NULL;
        [self _makeErrorWithMessage:@"cannot find end of regex" atPosition:cursor];
    }
    return cursor;
}


#line 1647 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_numberlong_actions[] = {
	0, 1, 0, 1, 1
};

static const char _JSON_numberlong_key_offsets[] = {
	0, 0, 1, 2, 3, 4, 5, 6, 
	7, 8, 9, 10, 15, 22, 27
};

static const char _JSON_numberlong_trans_keys[] = {
	78, 117, 109, 98, 101, 114, 76, 111, 
	110, 103, 13, 32, 40, 9, 10, 13, 
	32, 45, 9, 10, 48, 57, 13, 32, 
	41, 9, 10, 0
};

static const char _JSON_numberlong_single_lengths[] = {
	0, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 3, 3, 3, 0
};

static const char _JSON_numberlong_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 1, 2, 1, 0
};

static const char _JSON_numberlong_index_offsets[] = {
	0, 0, 2, 4, 6, 8, 10, 12, 
	14, 16, 18, 20, 25, 31, 36
};

static const char _JSON_numberlong_indicies[] = {
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 7, 1, 8, 1, 
	9, 1, 10, 1, 10, 10, 11, 10, 
	1, 11, 11, 12, 11, 12, 1, 13, 
	13, 14, 13, 1, 1, 0
};

static const char _JSON_numberlong_trans_targs[] = {
	2, 0, 3, 4, 5, 6, 7, 8, 
	9, 10, 11, 12, 13, 13, 14
};

static const char _JSON_numberlong_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 0, 3
};

static const int JSON_numberlong_start = 1;
static const int JSON_numberlong_first_final = 14;
static const int JSON_numberlong_error = 0;

static const int JSON_numberlong_en_main = 1;


#line 598 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseNumberLongWithPointer:(const char *)p endPointer:(const char *)pe result:(NSNumber **)result
{
    NSNumber *numberValue = nil;
    int cs = 0;
    
    
#line 1713 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_numberlong_start;
	}

#line 606 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 1720 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_numberlong_trans_keys + _JSON_numberlong_key_offsets[cs];
	_trans = _JSON_numberlong_index_offsets[cs];

	_klen = _JSON_numberlong_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_numberlong_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_numberlong_indicies[_trans];
	cs = _JSON_numberlong_trans_targs[_trans];

	if ( _JSON_numberlong_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_numberlong_actions + _JSON_numberlong_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 584 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseIntegerWithPointer:p endPointer:pe result:&numberValue];
        if (strcmp(numberValue.objCType, @encode(long long)) != 0) {
            numberValue = [NSNumber numberWithLongLong:numberValue.longLongValue];
        }
        np--; // WHY???
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 1:
#line 594 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 1810 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 607 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
    if (cs >= JSON_numberlong_first_final && numberValue) {
        *result = numberValue;
        return p + 1; // why + 1 ???
    } else {
        *result = nil;
        return NULL;
    }
}


#line 1835 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_timestamp_actions[] = {
	0, 1, 0, 1, 1, 1, 2
};

static const char _JSON_timestamp_key_offsets[] = {
	0, 0, 1, 2, 3, 4, 5, 6, 
	7, 8, 9, 14, 21, 26, 33, 38
};

static const char _JSON_timestamp_trans_keys[] = {
	84, 105, 109, 101, 115, 116, 97, 109, 
	112, 13, 32, 40, 9, 10, 13, 32, 
	45, 9, 10, 48, 57, 13, 32, 44, 
	9, 10, 13, 32, 45, 9, 10, 48, 
	57, 13, 32, 41, 9, 10, 0
};

static const char _JSON_timestamp_single_lengths[] = {
	0, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 3, 3, 3, 3, 3, 0
};

static const char _JSON_timestamp_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 2, 1, 2, 1, 0
};

static const char _JSON_timestamp_index_offsets[] = {
	0, 0, 2, 4, 6, 8, 10, 12, 
	14, 16, 18, 23, 29, 34, 40, 45
};

static const char _JSON_timestamp_indicies[] = {
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 7, 1, 8, 1, 
	9, 1, 9, 9, 10, 9, 1, 10, 
	10, 11, 10, 11, 1, 12, 12, 13, 
	12, 1, 13, 13, 14, 13, 14, 1, 
	15, 15, 16, 15, 1, 1, 0
};

static const char _JSON_timestamp_trans_targs[] = {
	2, 0, 3, 4, 5, 6, 7, 8, 
	9, 10, 11, 12, 12, 13, 14, 14, 
	15
};

static const char _JSON_timestamp_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 1, 0, 0, 3, 0, 
	5
};

static const int JSON_timestamp_start = 1;
static const int JSON_timestamp_first_final = 15;
static const int JSON_timestamp_error = 0;

static const int JSON_timestamp_en_main = 1;


#line 639 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseTimestampWithPointer:(const char *)p endPointer:(const char *)pe result:(MODTimestamp **)result
{
    NSNumber *timeNumber = nil;
    NSNumber *incrementNumber = nil;
    int cs = 0;
    
    
#line 1906 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_timestamp_start;
	}

#line 648 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 1913 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_timestamp_trans_keys + _JSON_timestamp_key_offsets[cs];
	_trans = _JSON_timestamp_index_offsets[cs];

	_klen = _JSON_timestamp_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_timestamp_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_timestamp_indicies[_trans];
	cs = _JSON_timestamp_trans_targs[_trans];

	if ( _JSON_timestamp_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_timestamp_actions + _JSON_timestamp_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 623 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseIntegerWithPointer:p endPointer:pe result:&timeNumber];
        np--; // WHY???
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 1:
#line 630 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseIntegerWithPointer:p endPointer:pe result:&incrementNumber];
        if (np == NULL) { p--; {p++; goto _out; } } else { np--; {p = (( np))-1;} }
    }
	break;
	case 2:
#line 636 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 2008 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 649 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
    if (cs >= JSON_timestamp_first_final && timeNumber && incrementNumber) {
        *result = [[[MODTimestamp alloc] initWithTValue:timeNumber.intValue iValue:incrementNumber.intValue] autorelease];
        return p + 1; // why + 1 ???
    } else {
        *result = nil;
        return NULL;
    }
}


#line 2033 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_symbol_actions[] = {
	0, 1, 0, 1, 1
};

static const char _JSON_symbol_key_offsets[] = {
	0, 0, 1, 2, 3, 4, 5, 6, 
	11, 17, 22
};

static const char _JSON_symbol_trans_keys[] = {
	83, 121, 109, 98, 111, 108, 13, 32, 
	40, 9, 10, 13, 32, 34, 39, 9, 
	10, 13, 32, 41, 9, 10, 0
};

static const char _JSON_symbol_single_lengths[] = {
	0, 1, 1, 1, 1, 1, 1, 3, 
	4, 3, 0
};

static const char _JSON_symbol_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 0, 1, 
	1, 1, 0
};

static const char _JSON_symbol_index_offsets[] = {
	0, 0, 2, 4, 6, 8, 10, 12, 
	17, 23, 28
};

static const char _JSON_symbol_indicies[] = {
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 6, 6, 7, 6, 
	1, 7, 7, 8, 8, 7, 1, 9, 
	9, 10, 9, 1, 1, 0
};

static const char _JSON_symbol_trans_targs[] = {
	2, 0, 3, 4, 5, 6, 7, 8, 
	9, 9, 10
};

static const char _JSON_symbol_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 0, 3
};

static const int JSON_symbol_start = 1;
static const int JSON_symbol_first_final = 10;
static const int JSON_symbol_error = 0;

static const int JSON_symbol_en_main = 1;


#line 674 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseSymbolWithPointer:(const char *)p endPointer:(const char *)pe result:(MODSymbol **)result
{
    NSString *symbol = nil;
    int cs = 0;
    
    
#line 2097 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_symbol_start;
	}

#line 682 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 2104 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_symbol_trans_keys + _JSON_symbol_key_offsets[cs];
	_trans = _JSON_symbol_index_offsets[cs];

	_klen = _JSON_symbol_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_symbol_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_symbol_indicies[_trans];
	cs = _JSON_symbol_trans_targs[_trans];

	if ( _JSON_symbol_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_symbol_actions + _JSON_symbol_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 665 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        np = [self _parseStringWithPointer:p endPointer:pe result:&symbol];
        if (np == NULL) { p--; {p++; goto _out; } } else { {p = (( np))-1;} }
    }
	break;
	case 1:
#line 671 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 2190 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 683 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
    if (cs >= JSON_symbol_first_final && symbol) {
        *result = [[[MODSymbol alloc] initWithValue:symbol] autorelease];
        return p + 1; // why + 1 ???
    } else {
        *result = nil;
        return NULL;
    }
}

- (const char *)_parseWordWithPointer:(const char *)string endPointer:(const char *)stringEnd result:(NSString **)result
{
    NSString *buffer;
    NSMutableString *mutableResult;
    const char *cursor;
    NSCharacterSet *wordCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890_$#"];
    
    mutableResult = [[NSMutableString alloc] init];
    cursor = string;
    while (cursor < stringEnd && [wordCharacterSet characterIsMember:cursor[0]]) {
        cursor++;
    }
    buffer = [[NSString alloc] initWithBytesNoCopy:(void *)string length:cursor - string encoding:NSUTF8StringEncoding freeWhenDone:NO];
    *result = buffer;
    [buffer autorelease];
    cursor++;
    return cursor;
}

- (const char *)_parseStringWithPointer:(const char *)string endPointer:(const char *)stringEnd result:(NSString **)result
{
    NSMutableString *mutableResult;
    const char *unescape, *bookmark, *cursor;
    int unescapeLength;
    char quoteString;
    NSString *buffer;
    
    mutableResult = [[NSMutableString alloc] init];
    quoteString = string[0];
    cursor = string + 1;
    bookmark = cursor;
    while (cursor < stringEnd && *cursor != quoteString) {
        if (*cursor == '\\') {
            unescape = (char *) "?";
            unescapeLength = 1;
            if (cursor > bookmark) {
                // if the string starts with a \, there is no need to add anything
                buffer = [[NSString alloc] initWithBytesNoCopy:(void *)bookmark length:cursor - bookmark encoding:NSUTF8StringEncoding freeWhenDone:NO];
                [mutableResult appendString:buffer];
                [buffer release];
            }
            switch (*++cursor) {
                case 'n':
                    unescape = (char *) "\n";
                    break;
                case 'r':
                    unescape = (char *) "\r";
                    break;
                case 't':
                    unescape = (char *) "\t";
                    break;
                case '"':
                    unescape = (char *) "\"";
                    break;
                case '\'':
                    unescape = (char *) "'";
                    break;
                case '\\':
                    unescape = (char *) "\\";
                    break;
                case 'b':
                    unescape = (char *) "\b";
                    break;
                case 'f':
                    unescape = (char *) "\f";
                    break;
                default:
                    // take it as a regular character
                    bookmark = cursor;
                    continue;
            }
            buffer = [[NSString alloc] initWithBytesNoCopy:(void *)unescape length:unescapeLength encoding:NSUTF8StringEncoding freeWhenDone:NO];
            [mutableResult appendString:buffer];
            [buffer release];
            bookmark = ++cursor;
        } else {
            cursor++;
        }
    }
    if (*cursor == quoteString) {
        buffer = [[NSString alloc] initWithBytesNoCopy:(void *)bookmark length:cursor - bookmark encoding:NSUTF8StringEncoding freeWhenDone:NO];
        [mutableResult appendString:buffer];
        [buffer release];
        *result = [mutableResult autorelease];
        cursor++;
    } else {
        cursor = NULL;
        [self _makeErrorWithMessage:@"cannot find end of string" atPosition:cursor];
    }
    return cursor;
}


#line 2307 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_array_actions[] = {
	0, 1, 0, 1, 1
};

static const char _JSON_array_key_offsets[] = {
	0, 0, 1, 23, 29, 50
};

static const char _JSON_array_trans_keys[] = {
	91, 13, 32, 34, 39, 45, 66, 73, 
	91, 93, 102, 110, 123, 9, 10, 47, 
	57, 77, 79, 83, 84, 116, 117, 13, 
	32, 44, 93, 9, 10, 13, 32, 34, 
	39, 45, 66, 73, 91, 102, 110, 123, 
	9, 10, 47, 57, 77, 79, 83, 84, 
	116, 117, 0
};

static const char _JSON_array_single_lengths[] = {
	0, 1, 12, 4, 11, 0
};

static const char _JSON_array_range_lengths[] = {
	0, 0, 5, 1, 5, 0
};

static const char _JSON_array_index_offsets[] = {
	0, 0, 2, 20, 26, 43
};

static const char _JSON_array_indicies[] = {
	0, 1, 0, 0, 2, 2, 2, 2, 
	2, 2, 3, 2, 2, 2, 0, 2, 
	2, 2, 2, 1, 4, 4, 5, 3, 
	4, 1, 5, 5, 2, 2, 2, 2, 
	2, 2, 2, 2, 2, 5, 2, 2, 
	2, 2, 1, 1, 0
};

static const char _JSON_array_trans_targs[] = {
	2, 0, 3, 5, 3, 4
};

static const char _JSON_array_trans_actions[] = {
	0, 0, 1, 3, 0, 0
};

static const int JSON_array_start = 1;
static const int JSON_array_first_final = 5;
static const int JSON_array_error = 0;

static const int JSON_array_en_main = 1;


#line 810 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (const char *)_parseArrayWithPointer:(const char *)p endPointer:(const char *)pe result:(NSMutableArray **)result
{
    int cs = 0;
    
    if (_maxNesting && _currentNesting > _maxNesting) {
        [NSException raise:@"NestingError" format:@"nesting of %d is too deep", _currentNesting];
    }
    *result = [[[NSMutableArray alloc] init] autorelease];
    
    
#line 2375 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_array_start;
	}

#line 822 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
#line 2382 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_array_trans_keys + _JSON_array_key_offsets[cs];
	_trans = _JSON_array_index_offsets[cs];

	_klen = _JSON_array_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_array_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _JSON_array_indicies[_trans];
	cs = _JSON_array_trans_targs[_trans];

	if ( _JSON_array_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_array_actions + _JSON_array_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 791 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        id value;
        const char *np = [self _parseValueWithPointer:p endPointer:pe result:&value];
        if (np == NULL) {
            p--; {p++; goto _out; }
        } else {
            [*result addObject:value];
            {p = (( np))-1;}
        }
    }
	break;
	case 1:
#line 802 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{ p--; {p++; goto _out; } }
	break;
#line 2473 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 823 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
    if(cs >= JSON_array_first_final) {
        return p + 1;
    } else {
        [NSException raise:@"ParserError"format:@"%u: unexpected token at '%s'", __LINE__, p];
        return NULL;
    }
}


#line 2497 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
static const char _JSON_actions[] = {
	0, 1, 0, 1, 1
};

static const char _JSON_key_offsets[] = {
	0, 0, 6
};

static const char _JSON_trans_keys[] = {
	13, 32, 91, 123, 9, 10, 13, 32, 
	9, 10, 0
};

static const char _JSON_single_lengths[] = {
	0, 4, 2
};

static const char _JSON_range_lengths[] = {
	0, 1, 1
};

static const char _JSON_index_offsets[] = {
	0, 0, 6
};

static const char _JSON_trans_targs[] = {
	1, 1, 2, 2, 1, 0, 2, 2, 
	2, 0, 0
};

static const char _JSON_trans_actions[] = {
	0, 0, 3, 1, 0, 0, 0, 0, 
	0, 0, 0
};

static const int JSON_start = 1;
static const int JSON_first_final = 2;
static const int JSON_error = 0;

static const int JSON_en_main = 1;


#line 857 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"


- (id)parseJson:(NSString *)source withError:(NSError **)error
{
    const char *p, *pe;
    id result = nil;
    int cs = 0;
    
    self.error = nil;
    _cStringBuffer = [source UTF8String];
    
#line 2552 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	cs = JSON_start;
	}

#line 868 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    p = _cStringBuffer;
    pe = p + strlen(p);
    
#line 2561 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _JSON_trans_keys + _JSON_key_offsets[cs];
	_trans = _JSON_index_offsets[cs];

	_klen = _JSON_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _JSON_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	cs = _JSON_trans_targs[_trans];

	if ( _JSON_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _JSON_actions + _JSON_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 839 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        _currentNesting = 1;
        np = [self _parseObjectWithPointer:p endPointer:pe result:&result];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
	case 1:
#line 846 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
	{
        const char *np;
        _currentNesting = 1;
        np = [self _parseArrayWithPointer:p endPointer:pe result:&result];
        if (np == NULL) { p--; {p++; goto _out; } } else {p = (( np))-1;}
    }
	break;
#line 2652 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}

#line 871 "/Users/jerome/Sources/MongoHub-Mac/Libraries/mongo-objc-driver/Sources/MODRagelJsonParser.rl"
    
    if (cs < JSON_first_final || p != pe) {
        result = nil;
        if (!self.error) {
            [self _makeErrorWithMessage:@"unexpected token" atPosition:p];
        }
    }
    *error = self.error;
    return result;
}

@end
