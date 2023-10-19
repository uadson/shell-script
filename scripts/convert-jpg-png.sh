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
