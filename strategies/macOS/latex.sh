#!/usr/bin/env bash

STRATEGY_VERSION="v001"


install() {
    install_required_pkg
    setup_mactex
    vscode
}

uninstall() {
    brew cask uninstall mactex-no-gui
}

update() {
    echo "🍺  Homebrewをアップデートしています..."
    brew update
    echo "🍺  MacTexをアップデートしています..."
    brew cask upgrade mactex-no-gui
    echo "📃  MacTexのパッケージをアップデートしています..."
    sudo tlmgr update --self --all
}


install_required_pkg() {
    echo "🍺  Homebrewをアップデートしています...."
    brew update
    echo "🍺  MacTexをインストールしています..."
    brew cask install mactex-no-gui
}

setup_mactex() {
    echo "📃  パスを設定しています..."
    /usr/local/texlive/2019/bin/x86_64-darwin/tlmgr path add
    echo "📃  MacTexのパッケージをアップデートしています..."
    sudo tlmgr update --self --all
    echo "📃  MacTexはデフォルトでA4用紙サイズを使用します"
    sudo tlmgr paper a4
}

vscode() {
    if [ -e /Applications/Visual\ Studio\ Code.app ]; then
        echo "⬇️  TexWorkshopをインストールしています..."
        /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension james-yu.latex-workshop
    fi
}

main() {
    install_required_pkg
    setup_mactex
    vscode
}
