#!/bin/bash

##########
# Básico #
##########

# definindo uma variável que receberá o caminho do diretório
# IMAGES_PATH=~/repos/django-init/imagens-livros

# recebendo parâmetros informados pelo usuário um a um e a cada parâmetro uma linha de código
# convert $IMAGES_PATH/$1.jpg $IMAGES_PATH/$1.png
# convert $IMAGES_PATH/$2.jpg $IMAGES_PATH/$2.png

# laço for
# não há quantidade definida de parâmetros porém há a necessidade de serem informados pelo usuário
# for image in $@
# do
#         convert $IMAGES_PATH/$image.jpg $IMAGES_PATH/$image.png
# done

# ao invés de criar uma variável, pode-se executar um comando para ir até o diretório
# cd ~/repos/django-init/imagens-livros

# verificando a existência do diretório png
# if [ ! -d png ]
# then
#     mkdir png
# fi

### exemplo
# arquivo = algoritmos.jpg
# input = ls algoritmos.jpg | awk -F. '{ print $1 }'
# output = algoritmos

# convertendo os arquivos automaticamente e salvando no diretório png
# for image in *.jpg
# do
#     result=$(ls $image | awk -F. '{ print $1 }')
#     convert $result.jpg png/$result.png
# done

#### Função

converte_imagem(){
    # caminho do diretório
    cd ~/repos/shell-script/imagens-livros
    # verificando se há existência do diretório png, se não houver o mesmo será criado
    if [! -d png ]
    then
        mkdir png
    fi

    # iterando sobre cada imagem .jpg e convertendo-a para png e então movendo-a para o diretório png
    for imagem in *.jpg
    do
        # faz a leitura até o campo . de cada imagem retornado o nome do arquivo sem a extensão
        ### a palavra reservada local estabelece o acesso à variável somente dentro do escopo da função
        local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
        convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
}

converte_imagem

# retornando status de saída do script
## se o status for 0 então houve êxito no processo, caso contrário, se o status for de 1 a 255, houve então uma falha no processo

if [ $? -eq 0 ]
    echo "Processo realizado com sucesso"
else
    echo "Houve uma falha no processo"
fi


### Simulando um erro no processol
converte_imagem(){
    # caminho do diretório (falso)
    cd ~/repos/shell-script/IMAGENS-LIVROS
    # verificando se há existência do diretório png, se não houver o mesmo será criado
    if [! -d png ]
    then
        mkdir png
    fi

    # iterando sobre cada imagem .jpg e convertendo-a para png e então movendo-a para o diretório png
    for imagem in *.jpg
    do
        # faz a leitura até o campo . de cada imagem retornado o nome do arquivo sem a extensão
        ### a palavra reservada local estabelece o acesso à variável somente dentro do escopo da função
        local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
        convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
}

### redirecionado falhas de execução no processo para um arquivo de log | 0 entrada padrão | 1 saída padrão | 2 saída de erro padrão

converte_imagem 2>erros_conversao.txt

# retornando status de saída do script
## se o status for 0 então houve êxito no processo, caso contrário, se o status for de 1 a 255, houve então uma falha no processo

if [ $? -eq 0 ]
    echo "Processo realizado com sucesso"
else
    echo "Houve uma falha no processo"
fi
