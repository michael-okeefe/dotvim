# Michael O'Keefe's .vim

To use this setup, first install vim and pathogen in the usual way. Then:

    cd ~
    git clone https://github.com/michael-okeefe/dotvim.git ~/.vim
    cd .vim
    ln -s vimrc ~/.vimrc
    ln -s gvimrc ~/.gvimrc
    cd ~/.vim/bundle
    rake install
    
To add new bundles,

1. add the git url to the bundle/repos.txt file
2. commit bundle/repos.txt to the git repository
3. cd ~/.vim/bundle
4. rake install

To update existing bundles,

1. cd ~/.vim/bundle
2. rake update
 
