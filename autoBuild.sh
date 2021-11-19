#!/bin/bash

current_create_time=`date +"%Y%m%d%H%M%S"`
echo "$current_create_time 开始编译。。。"
project_path=$(cd `dirname $0`; pwd)
project_name="${project_path##*/}"
mkdir "$project_name-$current_create_time""-relase"
flutter clean
flutter build appbundle  --release
cp build/app/outputs/bundle/release/app-release.aab ./"$project_name-$current_create_time""-relase"
flutter build apk --release
cp build/app/outputs/flutter-apk/app-release.apk ./"$project_name-$current_create_time""-relase"
# shellcheck disable=SC2164
cd "$project_name-$current_create_time""-relase"
mv app-release.aab "$project_name-$current_create_time""-relase.aab"
mv app-release.apk "$project_name-$current_create_time""-relase.apk"
end_time=`date +"%Y%m%d%H%M%S"`
echo "$end_time 结束编译。。。"
cd ../
open "$project_name-$current_create_time""-relase"
