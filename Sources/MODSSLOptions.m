//
//  MODSSLOptions.m
//  MongoObjCDriver
//
//  Created by Jérôme Lebel on 24/08/2014.
//
//

#import "MongoObjCDriver-private.h"
#include "mongoc-ssl.h"

@interface MODSSLOptions ()
@property (nonatomic, readwrite, strong) NSString *pemFileName;
@property (nonatomic, readwrite, strong) NSString *pemPassword;
@property (nonatomic, readwrite, strong) NSString *caFileName;
@property (nonatomic, readwrite, strong) NSString *caDirectory;
@property (nonatomic, readwrite, strong) NSString *crlFileName;
@property (nonatomic, readwrite, assign) BOOL weakCertificate;
@end

@implementation MODSSLOptions

- (instancetype)initWithPemFileName:(NSString *)pemFileName pemPassword:(NSString *)pemPassword caFileName:(NSString *)caFileName caDirectory:(NSString *)caDirectory crlFileName:(NSString *)crlFileName weakCertificate:(BOOL)weakCertificate
{
    self = [self init];
    if (self) {
        self.pemFileName = pemFileName;
        self.pemPassword = pemPassword;
        self.caFileName = caFileName;
        self.caDirectory = caDirectory;
        self.crlFileName = crlFileName;
        self.weakCertificate = weakCertificate;
    }
    return self;
}

@end

@implementation MODSSLOptions (private)

+ (instancetype)sslOptionsWithMongocSSLOpt:(const mongoc_ssl_opt_t *)sslOpt
{
    MODSSLOptions *result;
    
    result = MOD_AUTORELEASE([[MODSSLOptions alloc] init]);
    if (sslOpt->pem_file) result.pemFileName = [NSString stringWithUTF8String:sslOpt->pem_file];
    if (sslOpt->pem_pwd) result.pemPassword = [NSString stringWithUTF8String:sslOpt->pem_pwd];
    if (sslOpt->ca_file) result.caFileName = [NSString stringWithUTF8String:sslOpt->ca_file];
    if (sslOpt->ca_dir) result.caDirectory = [NSString stringWithUTF8String:sslOpt->ca_dir];
    if (sslOpt->crl_file) result.crlFileName = [NSString stringWithUTF8String:sslOpt->crl_file];
    result.weakCertificate = sslOpt->weak_cert_validation;
    return result;
}

- (void)getMongocSSLOpt:(mongoc_ssl_opt_t *)sslOpt
{
    NSParameterAssert(sslOpt->pem_file == NULL);
    NSParameterAssert(sslOpt->pem_pwd == NULL);
    NSParameterAssert(sslOpt->ca_file == NULL);
    NSParameterAssert(sslOpt->ca_dir == NULL);
    NSParameterAssert(sslOpt->crl_file == NULL);
    sslOpt->pem_file = self.pemFileName.UTF8String;
    sslOpt->pem_pwd = self.pemPassword.UTF8String;
    sslOpt->ca_file = self.caFileName.UTF8String;
    sslOpt->ca_dir = self.caDirectory.UTF8String;
    sslOpt->crl_file = self.crlFileName.UTF8String;
    sslOpt->weak_cert_validation = self.weakCertificate;
}

@end
