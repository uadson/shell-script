#!/bin/bash

# ### Antes do script ###

# ├── imagens-novos-livros
# │   ├── amazon_aws.jpg
# │   ├── backend
# │   │   ├── java
# │   │   │   ├── algoritmos.jpg
# │   │   │   ├── design_patterns.jpg
# │   │   │   ├── java_basico
# │   │   │   │   ├── certificacao_java_basico
# │   │   │   │   │   └── certificacao_java.jpg
# │   │   │   │   ├── orientacao_objetos_java.jpg
# │   │   │   │   └── tdd_java.jpg
# │   │   │   ├── rest.jpg
# │   │   │   └── spring_framework.jpg
# │   │   ├── node.jpg
# │   │   ├── php
# │   │   │   ├── php_mysql.jpg
# │   │   │   ├── tdd_php.jpg
# │   │   │   └── zend.jpg
# │   │   └── ruby.jpg
# │   ├── business
# │   │   ├── direto_ao_ponto.jpg
# │   │   ├── empreendedor.jpg
# │   │   ├── produtividade.jpg
# │   │   └── startup.jpg
# │   ├── frontend
# │   │   ├── css.jpg
# │   │   ├── es6.jpg
# │   │   ├── jogos_html.jpg
# │   │   ├── jquery.jpg
# │   │   ├── photoshop.jpg
# │   │   └── web_responsivo.jpg
# │   ├── mobile
# │   │   ├── android.jpg
# │   │   ├── cordova.jpg
# │   │   ├── games
# │   │   │   ├── jogos_android.jpg
# │   │   │   └── jogos_ios.jpg
# │   │   ├── ios.jpg
# │   │   ├── swift.jpg
# │   │   └── windows_phone.jpg
# │   └── windows_server.jpg
# └── scripts
#     ├── convert-jpg-png.sh
#     ├── convert-new-books.sh
#     ├── creating-dir.sh
#     ├── logs
#     │   └── error.txt
#     └── move-jpg-to-dir.sh


converte_imagem(){
    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

scannear_diretorio(){
    cd $1
    # Fazer varredura no diretorio
    for arquivo in *
    do
        # Obtém o caminho do arquivo dentro do diretório e armazena em um diretorio
        local caminho_arquivo=$(find ~/repos/shell-script/imagens-novos-livros -name $arquivo)
        # Se for um diretorio
        if [ -d $caminho_arquivo ]
        then
            # Entrar no diretorio e fazer varredura do conteudo
            scannear_diretorio $caminho_arquivo
        else
            # Se for um arquivo
            # Conversao jpg para png
            converte_imagem $caminho_arquivo
        fi
    done
}

scannear_diretorio ~/repos/shell-script/imagens-novos-livros

if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve um problema na conversão"
fi


# """
# #### depois do script ####
# ├── amazon_aws.jpg
# ├── amazon_aws.png
# ├── backend
# │   ├── java
# │   │   ├── algoritmos.jpg
# │   │   ├── algoritmos.png
# │   │   ├── design_patterns.jpg
# │   │   ├── design_patterns.png
# │   │   ├── java_basico
# │   │   │   ├── certificacao_java_basico
# │   │   │   │   ├── certificacao_java.jpg
# │   │   │   │   └── certificacao_java.png
# │   │   │   ├── orientacao_objetos_java.jpg
# │   │   │   ├── orientacao_objetos_java.png
# │   │   │   ├── tdd_java.jpg
# │   │   │   └── tdd_java.png
# │   │   ├── rest.jpg
# │   │   ├── rest.png
# │   │   ├── spring_framework.jpg
# │   │   └── spring_framework.png
# │   ├── node.jpg
# │   ├── node.png
# │   ├── php
# │   │   ├── php_mysql.jpg
# │   │   ├── php_mysql.png
# │   │   ├── tdd_php.jpg
# │   │   ├── tdd_php.png
# │   │   ├── zend.jpg
# │   │   └── zend.png
# │   ├── ruby.jpg
# │   └── ruby.png
# ├── business
# │   ├── direto_ao_ponto.jpg
# │   ├── direto_ao_ponto.png
# │   ├── empreendedor.jpg
# │   ├── empreendedor.png
# │   ├── produtividade.jpg
# │   ├── produtividade.png
# │   ├── startup.jpg
# │   └── startup.png
# ├── frontend
# │   ├── css.jpg
# │   ├── css.png
# │   ├── es6.jpg
# │   ├── es6.png
# │   ├── jogos_html.jpg
# │   ├── jogos_html.png
# │   ├── jquery.jpg
# │   ├── jquery.png
# │   ├── photoshop.jpg
# │   ├── photoshop.png
# │   ├── web_responsivo.jpg
# │   └── web_responsivo.png
# ├── mobile
# │   ├── android.jpg
# │   ├── android.png
# │   ├── cordova.jpg
# │   ├── cordova.png
# │   ├── games
# │   │   ├── jogos_android.jpg
# │   │   ├── jogos_android.png
# │   │   ├── jogos_ios.jpg
# │   │   └── jogos_ios.png
# │   ├── ios.jpg
# │   ├── ios.png
# │   ├── swift.jpg
# │   ├── swift.png
# │   ├── windows_phone.jpg
# │   └── windows_phone.png
# ├── windows_server.jpg
# └── windows_server.png
# """