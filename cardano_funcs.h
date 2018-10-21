//
//  cardano_funcs.h
//  Cardano Lib - iOS Test
//
//  Created by HM on 21/10/2018.
//  Copyright © 2018 Lambo Corp. All rights reserved.
//

#include <inttypes.h>

#ifndef cardano_funcs_h
#define cardano_funcs_h

int8_t my_b58_encode( const uint8_t *bytes, unsigned int size, char *encoded );
int8_t my_b58_decode( const char *encoded, uint8_t *bytes );

#endif /* cardano_funcs_h */
