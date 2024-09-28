#! /bin/bash

# 状況：「testFolder」フォルダが存在しない
# 期待値「testFolder」フォルダが作成される(正常終了)
testCanMkdir(){
    folderName="testFolder"
    if [ -d $folderName ]; then
        rm -r $folderName
    fi

    . exe.sh $folderName

    # 1.正常終了したこと
    assertEquals $? 0
    # 2.フォルダが存在すること
    assertTrue "[ -d $folderName ]"
}

# 状況：「testFolder」フォルダが存在する
# 期待値「testFolder」フォルダが作成されない(異常終了)
testDirAlreadyExist(){
    folderName="testFolder"
    if [ -d $folderName ]; then
        rm -r $folderName
    fi
    mkdir $folderName

    . exe.sh $folderName

    # 1.異常終了したこと
    assertEquals $? 1
    # 2.フォルダが存在すること
    assertTrue "[ -d $folderName ]"
}

. ~/shunit2/shunit2