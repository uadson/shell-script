#!/bin/bash

### Passos ###

##### Funções

get_file(){
    wget 'https://gist.github.com/uadson/11d3fe6938887994a153c6c1b6898f95/archive/cd5e5aad7821e5461b71c6a47c8859dbd255abc8.zip'  

}

walking(){
    cd $1 
    for dir in *
    do
        local dir_path=$(find $1 -name $dir)
        if [ $dir -eq 0 ]
        then
            echo $dir_path
        else
            echo "Não é diretório"
        fi
    done

}

creating_dir(){
    # 1º definindo um local para criação do primeiro diretório
    # o diretório será criado dentro do repositório shell-script e terá o nome de projects
    local path=$(pwd)
    cd $path

    # 2º será feito verificação para que, caso o diretório de nome projects não seja encontrado, o mesmo deverá ser criado
    # caso projects já exista o script passará para o 3º passo
    
    if [ ! -d projects ]
    then
        mkdir projects
        # 3º criando um segundo diretório de nome core dentro do diretório projects
        mkdir projects/core
    else
        if [ -d projects ]
        then
            mkdir projects/core
        fi
    fi

}



# Executando a função e redirecinando erros para um arquivo de log
# creating_dir 2>logs/error.txt

path=$(pwd)
walking $path