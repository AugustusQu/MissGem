set -e
cd ../../MissGem/proto
sh ./build_proto_objc.sh

cp objc/* ../../MissGem/proto
echo 'copy proto file done!'
cd -
pod update MissGemProto --verbose --no-repo-update
