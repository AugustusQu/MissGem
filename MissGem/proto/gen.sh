./protoc --plugin=protoc-gen-grpc=grpc_objective_c_plugin --objc_out=./test --grpc_out=./test ./specs/*.proto
echo 'done!'
