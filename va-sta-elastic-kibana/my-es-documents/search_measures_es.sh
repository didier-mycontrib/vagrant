base_url='http://localhost:9200/measure-index'
es_doctype_url="${base_url}/measures"
es_search_url="${es_doctype_url}/_search"
echo ${es_search_url}
curl -XPOST ${es_search_url}  -H 'Content-Type: application/json' -d '
{
"query" : { 
      "range" : { "timestamp": 
	                   { "gte" : "2018-08-20T13:00:00" , "lt" : "2018-08-20T14:00:00" }
				}
           } 
}'

other_query='
{
"query" : { 
      "query_string" : { "query": "50"}
           } 
}' 
