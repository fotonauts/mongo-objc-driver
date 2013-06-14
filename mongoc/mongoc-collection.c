/*
 * Copyright 2013 10gen Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#include "mongoc-collection.h"
#include "mongoc-collection-private.h"
#include "mongoc-cursor-private.h"


mongoc_collection_t *
mongoc_collection_new (mongoc_client_t *client,
                       const char      *name)
{
   mongoc_collection_t *collection;

   bson_return_val_if_fail(client, NULL);
   bson_return_val_if_fail(name, NULL);

   collection = bson_malloc0(sizeof *collection);
   collection->client = client;
   snprintf(collection->ns, sizeof collection->ns - 1, "%s", name);
   collection->ns[sizeof collection->ns - 1] = '\0';

   return collection;
}


void
mongoc_collection_destroy (mongoc_collection_t *collection)
{
   bson_return_if_fail(collection);

   bson_free(collection);
}


mongoc_cursor_t *
mongoc_collection_find (mongoc_collection_t  *collection,
                        mongoc_query_flags_t  flags,
                        bson_uint32_t         skip,
                        bson_uint32_t         limit,
                        const bson_t         *query,
                        const bson_t         *fields,
                        const bson_t         *options)
{
   bson_return_val_if_fail(collection, NULL);
   bson_return_val_if_fail(query, NULL);

   return mongoc_cursor_new(collection->client, collection->ns, flags, skip,
                            limit, 0, query, fields, options);
}