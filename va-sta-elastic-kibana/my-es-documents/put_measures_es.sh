base_url='http://localhost:9200/measure-index'
es_bulk_url="${base_url}/measures/_bulk"
es_firstdoc_url="${base_url}/measures/m0"
echo ${es_firstdoc_url}
echo ${es_doctype_url}
#curl -XPUT ${es_firstdoc_url} -d @measures/measure0.json -H 'Content-Type: application/json'

#bulk data must be send with --data-binary and Content-Type: application/x-ndjson
curl -XPOST ${es_bulk_url} --data-binary @measures/measures2.json -H 'Content-Type: application/x-ndjson'