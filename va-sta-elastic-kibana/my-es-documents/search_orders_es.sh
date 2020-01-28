base_url='http://localhost:9200/order-index'
es_doctype_url="${base_url}/orders"
es_search_url="${es_doctype_url}/_search"
echo ${es_search_url}
curl -XPOST ${es_search_url}  -H 'Content-Type: application/json' -d '
{
"query" : { 
      "regexp" : { "delivery-address": ".*rouen"}
           } 
}'

other_query='
{
"query" : { 
      "query_string" : { "query": "2020-01-14"}
           } 
}' 
