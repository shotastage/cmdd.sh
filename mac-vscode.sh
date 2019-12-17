#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function vscode {
    if [ -e /Applications/Visual\ Studio\ Code.app ]; then
        echo "🖥  Visual Studio Codeはすでにインストールされています."
        return
    fi
    echo "⬇️  Visual Studio Codeをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://go.microsoft.com/fwlink/?LinkID=620882"
    if [ -e ./?LinkID\=620882 ]; then
        mv ?LinkID\=620882 VSCode-darwin-stable.zip 
        echo "📦  パッケージを展開しています..."
        unzip VSCode-darwin-stable.zip >> /dev/null
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi
       
    echo "⬇️  アプリケーションをインストールしています..."
    mv Visual\ Studio\ Code.app/ /Applications/
    echo "🧹  クリーンアップしています..."
    rm VSCode-darwin-stable.zip
}

function uninstall {
    cd /Applications/
    rm -rf Opera.app
    echo "🧹 Opera has been uninstalled!"
}

function main {

    echo 
    echo "Version. 2019.12.16"
    echo "Copyright © 2019 Shota Shimazu All rights reserved."
    echo

    vscode
}
