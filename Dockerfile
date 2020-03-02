# Utilize esse arquivo para gerar uma imagem docker customizada do limarka
# Documentação: https://github.com/abntex/limarka/wiki/Limarka-com-Docker

FROM limarka/limarka:latest

# Adicione os pacotes que precisa instalar nessa imagem customizada:
RUN tlmgr update --self \
  && tlmgr install subfig csquotes minted fvextra lineno ifplatform xstring colortbl
