#!/bin/bash

### Passos ###

# Função
creating_dir(){
    # 1º definindo um local para criação do primeiro diretório
    # o diretório será criado dentro do repositório shell-script e terá o nome de projects
    cd ~/repos/shell-script

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
creating_dir 2>logs/error.txt
