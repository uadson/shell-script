#!/bin/bash

cd ~/repos/django-init/imagens-livros

if [ ! -d jpg ]
then
    mkdir jpg
fi

for image in *.jpg
do
    mv $image jpg
done