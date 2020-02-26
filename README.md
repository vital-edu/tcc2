# Trabalho de Conclusão de Curso 2 - Engenharia de Software - UnB/FGA


## Dependências

Para gerar o PDF é necessário ter o [Docker Engine](https://docs.docker.com/install/) instalado.

## Instruções para gerar o PDF

Com o docker instalado e configurado, adicione no `~/.bash_aliases` ou no `~/.bashrc`:


```bash
alias limarka_build='docker build -t limarka:customizada $@ - < Dockerfile'
alias limarka='docker run --mount src=`pwd`,target=/trabalho,type=bind limarka:customizada $@'
alias limarka_guard='docker run -it --entrypoint guard --mount src=`pwd`,target=/trabalho,type=bind limarka:customizada --no-bundler-warning $@'
```

Recarregue o seu terminal bash:

```bash
source ~/.bash_aliases
source ~/.bashrc # caso tenha usado o ~/.bashrc ao invés do ~/.bash_aliases
```

Execute dentro da pasta do projeto uma única vez o comando abaixo para gerar a imagem customizada:

```bash
limarka_build
```

Finalmente, para gerar o PDF, basta executar o comando:

```bash
limarka exec
```

Será gerado um arquivo PDF com o nome `xxx-Monografia.pdf`

## Mais informações sobre o Limarka

Para ter mais informações sobre o Limarka e como ele funciona, visite: https://github.com/abntex/limarka
