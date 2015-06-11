# Michael O'Keefe's .vim

To use this setup, first install vim and pathogen in the usual way. Then:

    cd ~
    git clone https://github.com/michael-okeefe/dotvim.git ~/.vim
    cd .vim
    mkdir ~/.vim/backup
    mkdir ~/.vim/tmp
    ln -s vimrc ~/.vimrc
    ln -s gvimrc ~/.gvimrc
    git submodule init
    git submodule update
    
To add new submodules, run the following from ~/.vim:

    git submodule add <submodule-git-address> bundle/<local-name>
    git add .
    git commit -m <your commit message>
    
To upgrade all git submodules, run the following from ~/.vim:

    git submodule foreach git pull origin master
