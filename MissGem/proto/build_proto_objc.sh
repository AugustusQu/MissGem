git pull
rm -rf objc/*
protoc --plugin=protoc-gen-grpc=grpc_objective_c_plugin --objc_out=./objc --grpc_out=./objc --proto_path=./specs ./specs/*.proto
echo 'build proto objc done!'