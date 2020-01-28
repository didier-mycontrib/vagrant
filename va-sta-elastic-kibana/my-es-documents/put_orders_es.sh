base_url='http://localhost:9200/order-index'
es_doc_url="${base_url}/orders/orderD"
echo ${es_doc_url}
curl -XPOST ${es_doc_url} -d @orders/orderD.json -H 'Content-Type: application/json'
#curl -XDELETE ${es_doc_url} 
