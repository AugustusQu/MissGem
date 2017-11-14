protoc-3.0.0-beta-1-windows-x86_64.exe --plugin=protoc-gen-grpc-java=protoc-gen-grpc-java-0.12.0-windows-x86_64.exe --grpc-java_out=./java --java_out=./java --proto_path=./specs ./specs/*.proto
echo 'proto build seccess.'
cp ./java/com/lz/turtle/proto/*.java ./../../turtle-server/turtle/turtle-server/src/main/java/com/lz/turtle/proto/
echo 'proto buyer proto file copy to server success.'
cp ./java/com/lz/turtle/proto/b/*.java ./../../turtle-server/turtle/turtle-server/src/main/java/com/lz/turtle/proto/b/
echo 'proto seller proto file copy to server success.'
cp ./java/com/lz/turtle/common/proto/*.java ./../../turtle-server/turtle/turtle-common/src/main/java/com/lz/turtle/common/proto/
echo 'proto server proto file copy to server success.'