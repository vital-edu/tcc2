# A criptomoeda Bitcoin

As criptomoedas, um dinheiro virtual que utiliza conceitos e algoritmos oriundos da criptografia, teve sua história moldada por pequenos e progressivos avanços na área da criptografia. Portanto, é importante entender a contribuição de diferentes autores que culminaram no advento do *Bitcoin*, a principal criptomoeda em circulação atualmente.

Embora já houvessem soluções de pagamento envolvendo dinheiro virtual em \citeyear{blindsignature}, \citeauthoronline{blindsignature} preocupou-se com uma importante característica das transações no mundo real que não estava presente nas transações virtuais: a privacidade.

No mundo real, o dinheiro pode ser passado de Alice para Carlos sem que Bob ou qualquer outro agente saiba disso. Embora isso permita a utilização do dinheiro para fins ilícitos, essa característica também permite que os indivíduos possam realizar transações que caso fossem descobertas por terceiros lhe causariam constrangimento, humilhação, retaliação, e em último causo poderia servir como meio de coerção, repressão, censura e controle político por governos ou instituições privadas que tivessem o interesse de impedir a livre manifestação de opiniões e o direito a livre associação.

Com essa preocupação, \citeonline{blindsignature} descreveu as características que um sistema automatizado de pagamento virtual deveria ter:

1. Impossibilidade de terceiros determinarem o recebedor do pagamento, a data e hora que o pagamento foi realizado bem como a quantia que foi paga pelo indivíduo;
2. Capacidade dos indivíduos provarem que um pagamento foi efetuado ou determinar a identidade do beneficiário do pagamento sob circunstâncias excepcionais;
3. Capacidade de se negar o uso de meios de pagamentos reportados como roubados.

O sistema proposto baseava-se na utilização de assinaturas digitais e funcionaria da seguinte forma:

1. Um indivíduo, aqui chamado de Alice, utilizaria uma chave privada escolhida aleatoriamente e assinaria um documento digital;
2. Cada documento digital representa uma unidade de valor monetário;
3. Alice enviaria o documento digital assinado para um banco, aqui descrito como Bob;
4. Bob assinaria o documento recebido com sua chave privada e o devolveria a Alice;
5. Alice, com sua chave privada conseguiria verificar que o conteúdo do documento não foi alterado e que foi assinado por Bob. Caso fosse constatado uma fraude o processo seria interrompido;
6. Alice então teria um documento validado por Bob e poderia dar o documento posteriormente para o beneficiário do pagamento;
7. O beneficiário, aqui descrito como Carlos, enviaria o documento a Bob, que conseguiria verificar que a nota foi assinada com sua assinatura digital;
8. Bob então registraria que a nota foi utilizada e depositaria uma unidade de valor para o beneficiário. Caso a nota já tivesse sido marcada como utilizada, a operação seria interrompida, por ser uma fraude;

Com essa solução, Bob não conseguiria saber que Alice fez um pagamento para Carlos, já que o documento que Carlos apresentou a Bob poderia ter sido assinado por qualquer outra pessoa, e tampouco conseguiria saber a data do pagamento, já que Alice poderia demorar um tempo indefinido entre os passos 6 e 7.

A figura \ref{fig:blind-signature} ilustra o processo de assinatura do documento em alto nível e a figura \ref{fig:blind-signature-rsa} ilustra o processo utilizando o algoritmo Rivest–Shamir–Adleman (RSA).

\begin{figure}[htbp]
  \centering
  \caption{\label{fig:blind-signature}Exemplo em alto nível de uso de assinatura cega.}
  \includegraphics[width=1.0\textwidth]{imagens/blind-signature.jpg}
  \legend{Fonte: \citeonline{blindsignaturewiki}.}
\end{figure}

\begin{figure}[htbp]
  \centering
  \caption{\label{fig:blind-signature-rsa}Implementação da assinatura cega utilizando o algoritmo RSA.}
  \includegraphics[width=1.0\textwidth]{imagens/blind-signature-rsa.jpg}
  \legend{Fonte: \citeonline{blindsignaturewiki}.}
\end{figure}

Embora o processo descrito garanta que Bob não conheça o conteúdo do documento e por isso não consiga saber quem emitiu originalmente o documento, ele ainda requer que um agente central (Bob) registre as operações de entrada e saída de valor e garanta o valor monetário do documento, e por isso pode apenas ser considerado como uma camada de privacidade que complementa o sistema bancário vigente, trazendo o anonimato das operações transacionadas através de dinheiro em espécie para o mundo das transações virtuais.

Foi apenas em \citeyear{timestamp} que surgiu uma solução com potencial de resolver o problema da dependência de um agente central para registro de informações importantes. \citeonline{timestamp} pensando na facilidade em modificar e copiar documentos digitais, e no problema que isso causa ao tentar determinar quando um documento digital é criado ou modificado, criaram uma maneira de registrar documentos eletrônicos de forma a garantir a autenticidade, a data de registro, bem como a imutabilidade de seu conteúdo, e impossibilitando a adulteração dessas informações por quem os armazenassem.

Essa solução, que viria a ser conhecida como *blockchain*, consistia de um algoritmo de encadeamento de dados em que o elemento seguinte da cadeia é criado a partir de informações contidas no documento anteriormente registrado, e que seria armazenada e validado de forma descentralizada por seus utilizadores, garantindo que mesmo que um grupo de utilizadores tentassem corromper os dados, ou outros teriam como identificar a fraude.

A solução de \citeauthoronline{timestamp} foi concebida para funcionar com qualquer documento digital, independente do formato ou tamanho, e para garantir isso ele propôs o uso de uma família de funções criptograficamente segura e livre de colisões, mais conhecidas como funções *hash* (fig. \ref{fig:hash}).

\begin{figure}[htbp]
  \caption{\label{fig:hash}Exemplo de \emph{função hash}.}
  \begin{center}
    \includegraphics[width=0.5\textwidth]{imagens/hash.png}
  \end{center}
  \legend{Fonte: \citeonline{hashimage}.}
\end{figure}

A *função hash* garante que um arquivo de mesmo conteúdo, sempre gere um mesmo conjunto de caracteres (chamado de *hash do arquivo*, ou simplesmente *hash*) e que a probabilidade de dois ou mais arquivos diferentes produzirem o mesmo *hash* seja baixa o suficiente para ser desprezada. Com isso, arquivos gigantes podem ser reduzidos a poucos caracteres, facilmente armazenáveis e probabilisticamente únicos.

Qualquer adulteração de um documento gera um *hash* diferente, evidenciando uma tentativa de fraude do mesmo. Assim, se Alice pode registrar um documento *X* com Bob apenas aplicando uma *função hash F* conhecida no documento *X*, que geraria um *hash* *h* que deveria então ser armazenado por Bob.

Se Carlos, por exemplo, vier a suspeitar de que o arquivo *X* foi adulterado, bastaria ele usar a mesma *função hash f* no arquivo X e verificar se o *hash* produzido é o mesmo armazenado por Bob.

Porém, para garantir que a propriedade do documento X seja realmente de Alice, \citeauthoronline{timestamp} sugeriram o uso de assinaturas digitais.

Uma assinatura digital é equivalente a uma assinatura escrita, provendo uma maneira de produzir um documento digital cuja autenticidade pode ser verificada por qualquer um mas que não possa ser produzido por ninguém além do autor original.

A assinatura digital é possível através da utilização de um par de chaves *E* e *D* que possa ser utilizada em qualquer mensagem/documento *M*, possuindo as seguintes propriedades \cite{encdenc}:

1. *E* é uma função inversa de *D*;
2. Para cada mensagem *M*, *E(M)* e *D(M)* são fáceis de serem computados;
3. *E* é computacionalmente inviável de ser descoberto a partir de *D*;
4. *E* e *D* são computacionalmente fáceis de serem gerados a partir de uma chave *K*.

A propriedade 3 permite que a chave *D* possa ser exposta em meios públicos e acessíveis sem comprometer a chave *E*.

Através do uso do par de chaves *E* e *D*, \citeonline{encdenc} propôs que se Alice desejar enviar uma mensagem *M* para Carlos, ela deveria 'decriptar' a mensagem *M* usando a chave secreta *D\textsubscript{Alice}*, enviando para Carlos a mensagem *D\textsubscript{Alice}(M)*. Quando Carlos receber a mensagem *D\textsubscript{Alice}(M)*, ele poderá 'encriptá-la' utilizando a chave pública de Alice (*E\textsubscript{Alice}*) e ler o conteúdo original *M*.

A mensagem *D\textsubscript{A}(M)* deverá ser guardada para servir como prova de que Alice foi a autora da mensagem, já que qualquer pessoa que desconfie da autoria da mensagem apenas teria que usar a chave pública de Alice (*E\textsubscript{Alice}*) para produzir a mensagem *M*. Qualquer outra chave pública utilizada em *D\textsubscript{A}(M)* resultaria em um resultado completamente diferente de *M*.

Utilizando essa técnica se consegue averiguar a qualquer momento se um indivíduo assinou ou não um documento digital.

Além de identificar a autoria do documento também é importante armazenar a data e horário de criação ou modificação do documento, e \citeauthoronline{timestamp} para resolver esse problema sugeriram que o *hash* do arquivo deveria ser concatenado com o horário e data do registro e só então ser assinado com a chave *D* do autor do registro. Com isso, apenas com um *hash* pequeno poderia se registrar um documento com as informações de quando ele foi criado ou modificado e quem é o autor do documento.

Ainda assim, é necessário confiar em um agente central (Bob), que poderia facilmente ser corrompido por Carlos sem que Alice conseguisse provar a fraude. \citeauthoronline{timestamp} propuseram uma solução denominada *confiança distribuída*.

Nessa solução, haveria um gerador pseudoaleatório\footnote{\emph{gerador pseudoaleatório} é um algoritmo que usa \emph{bits} verdadeiramente aleatórios para gerar de forma determinística uma longa sequência de \emph{bits} \cite{pseudo}.} *G* disponível para todos os indivíduos que desejassem registrar documentos. Quando Alice desejasse registrar um documento, ela deveria gerar um *hash y* do documento, e usá-lo como *seed*\footnote{\emph{seed} (semente) é o nome que se dá a sequência de bits verdadeiramente aleatória utilizada no gerador pseudoaleatório.} para o gerador *G*, o que produzirá uma sequência de *bits* que podem ser agrupadas de maneira a forma um número *k* de *IDs*, conforme mostrado na equação \ref{eqn:g} \cite{timestamp}.

\begin{equation}
\label{eqn:g}
G(y) = (ID_{1}, ID_{2}, ..., ID_{k})
\end{equation}

Cada *ID* gerado corresponde a um identificador de um cliente (usuário desse sistema distribuído) e Alice deveria portanto enviar para cada um desses clientes uma requisição composta de seu próprio *ID* junto com o *hash y*. Cada cliente que recebesse essa requisição de Alice, deveria assinar a mensagem incluíndo o tempo *t* do início do processamento, conforme a equação \ref{eqn:s} e enviar o resultado de volta para Alice \cite{timestamp}.

\begin{equation}
\label{eqn:s}
s_{j} = \sigma_{j}(t, ID, y)
\end{equation}

O único requisito para essa arquitetura funcionar é haver uma lista pública de clientes disponíveis de maneira a ser possível interpretar o resultado de *G(y)* como um conjunto de *k* clientes prontos para serem requisitados.

Para resolver o possível problema de indisponibilidade de clientes \citeauthoronline{timestamp} afirmaram que bastaria a função *G* gerar um número suficientemente grande de *k* clientes de forma a garantir que haverá a disponibilidade de $k' < k$ clientes, sendo *k'* um número suficientemente grande de forma a garantir que seja improvável que a maioria dos clientes estejam ávidos por falsificar o *timestamp* do documento.

Com essa solução, \citeauthoronline{timestamp} elaboraram uma solução que embora tenha sido concebida para o registro de documentos digitais, poderia ser utilizada para criar um sistema de transações financeiras digitais que não estivesse livre de agentes centrais.

Em 1992, Timothy May, um físico aposentado, temendo as ameaças e restrições que os governos ao redor do mundo poderiam impor sobre o acesso as informações convidou um grupo de amigos à sua casa para discutir sobre privacidade e *internet* \cite{answertocash}.

Este grupo se auto nomeou *Cypherpunks* e em \citeyear{cyphermanifesto} lançou seu manifesto em que declara sua preocupação com a regulação da criptografia e cita sua intenção em criar uma moeda digital:

\begin{displayquote}[\citeonline{cyphermanifesto} - tradução do autor]

Nós, os \emph{Cypherpunks}, estamos dedicados a construir sistemas anônimos. Nós estamos defendendo nossa privacidade através da criptografia, com sistemas de encaminhamento de e-mails anônimos, com assinaturas digitais, e com dinheiro digital.

\end{displayquote}

Em \citeyear{junkmail}, \citeauthoronline{junkmail} propuseram uma técnica que poderia ser utilizada por provedores de e-mail em que seria requerida a computação de uma função moderadamente difícil para quem decidisse enviar um e-mail, dificultando o envio de grandes quantidades de e-mails, o que tinha como intenção reduzir o número de *SPAMs* (e-mails indesejados).

\citeauthoronline{junkmail} chamaram essa função de *função de precificação*, e foi apresentada como uma alternativa as soluções que estavam sendo propostas na época, que incluíam a criação de uma lei que caracterizava o envio de e-mails não autorizados como contravenção penal; e a cobrança de impostos para cada e-mail enviado ou a partir de certo número de e-mails enviados por dia.

\citeonline{hashcash} propôs uma solução semelhante, e segundo o autor, sem ter o conhecimento do trabalho de \citeauthoronline{junkmail}. Essa solução foi denominada *Hashcash* e também foi idealizada para reduzir o número de *SPAMs*, além de ser uma forma de prevenir ataques DDoS (*Distributed Denial of Service* - Ataque Distribuído de Negação de Serviço).

Para \citeauthoronline{hashcash}, as funções de custo deveriam ser eficientemente verificáveis e não proverem vantagem para o servidor responsável por criar os desafios, já que caso contrário, o servidor teria um conflito de interesses e teria a possibilidade de utilizar essa vantagem para ganhos próprios.

Alguns dos diferenciais da função de custo *Hashcash* eram as alterações dos desafios a cada intervalo de tempo, o que evitaria a pré-computação de respostas; e o ajuste do custo computacional necessário para decifrar o desafio, o que permitiria a adaptação do nível do desafio de acordo com a demanda de requisições que o servidor enfrentava.

O *Hashcash* veio a ser conhecido como sendo um algoritmo *PoW* (*Proof-of-Work* - Prova de Trabalho) e foi aprimorado por \citeauthor{rpow} em \citeyear{rpow}.

O algoritmo de \citeauthoronline{rpow}, o RPOW (*Reusable Proof-of-Work* - Prova de Trabalho Reutilizável), recebia um *hashcash* e o trocava por um *token* *RPOW* que poderia então ser gasto para produzir um novo *token RPOW*. Cada *token RPOW* poderia ser utilizado apenas uma vez e gerava um novo *token*.

Como o *RPOW* garante o conceito de gasto único, é sempre criado inicialmente a partir de uma prova de trabalho, e dá origem a um novo *token* que pode ser novamente trocado, pode-se considerá-lo como o primeiro bem digital que utiliza algoritmos criptográficos com capacidade de servir como meio de troca, um grande passo para a criação de uma moeda digital.

Em \citeyear{bitgold}, \citeauthoronline{bitgold} expressou sua preocupação com o fato de o valor do dinheiro atualmente utilizado pela sociedade depender exclusivamente na confiança depositada em um agente centralizador e propôs a moeda *Bit Gold* que teria como características: uma dependência mínima em agentes centralizadores, armazenada de forma segura, transferível, e que pudessem ter sua autenticidade verificada \cite{bitgold}. \citeauthoronline{bitgold} se inspirou nas propriedades dos metais preciosos, principalmente o ouro para conceber a ideia do *Bit Gold*.

O *Bit Gold* funcionaria da seguinte forma:

1. Um *conjunto de bits*, denominado *desafio criptográfico* seria criado;
2. Alice, em seu computador, geraria uma *prova de trabalho* a partir do *desafio criptográfico* utilizando uma função criptográfica de referência;
3. A *prova de trabalho* contém uma *marcação temporal* de quando foi produzida. Essa *marcação temporal* seria registrada por qualquer ou mesmo vários serviços de *marcação temporal* que comprovariam a confiabilidade da data de criação da *prova de trabalho*.
4. Alice registraria a *prova de trabalho* junto com a *marcação temporal* em um serviço computacionalmente distribuído compatível com o *Bit Gold*. A partir de então, esse seria oficialmente um registro *Bit Gold*;
5. O último registro de *Bit Gold* provê o *desafio criptográfico* que servirá como insumo para a próxima *prova de trabalho*, que gerará o próximo registro de *Bit Gold*;
6. Para verificar que Alice é a proprietária de um registro de *Bit Gold*, Bob checaria a cadeia de registros de *Bit Gold* em qualquer serviço de registro de *Bit Gold*;
7. Para averiguar o valor do registro de *Bit Gold*, Bob checaria e verificaria o *desafio criptográfico*, a *prova de trabalho* e a *marcação temporal* do registro.

Como cada registro de *Bit Gold* está ligado ao próximo registro de *Bit Gold*, e esses registros estão registrados em diversos serviços distribuídos e independentes, entende-se que essa cadeia de registros, a *blockchain*, é inalterável.

\citeauthoronline{bitgold} destaca que todos os tipos de dinheiro já utilizados tem alguma forma de insegurança, desde falsificação à facilidade de roubo, mas que provavelmente a pior insegurança que um dinheiro possa ter é a inflação. E o *Bit Gold* seria uma solução de moeda que apresentaria em sua arquitetura essa segurança contra a inflação.

E em \citeyear{bitcoin}, \citeauthoronline{bitcoin}, um pseudônimo pertencente a um ou vários indivíduos até hoje desconhecidos, a partir das ideias e tecnologias já apresentadas, concebeu o *Bitcoin*.

Embora tenha sido inspirado na ideia de *blockchain* concebida por \citeauthoronline{timestamp} e nas moedas *b-cash*, *Hascash* e provavelmente na moeda *Bit Gold*, o *Bitcoin* apresentou com mais detalhes como uma *blockchain* poderia ser utilizada para criar um sistema eletrônico de registro de transações que nâo dependesse de nenhum agente central e que conseguisse garantir as características necessárias para tornar-se uma moeda *de facto*.

\citeauthoronline{bitcoin} definiu o termo *moeda eletrônica* como sendo uma cadeia de assinaturas digitais \cite{bitcoin}, em que Alice transferiria uma quantia de dinheiro para Carlos assinando digitalmente o *hash* da última transação registrada junto com a chave pública de Carlos (fig. \ref{fig:transaction}).

\begin{figure}[htbp]
\caption{\label{fig:transaction}Registro de transação em uma cadeia de assinaturas digitais.}
\begin{center}
\includegraphics[width=1.0\textwidth]{imagens/transaction.png}
\end{center}
\legend{Fonte: \citeonline{bitcoin}.}
\end{figure}

Além do simples registro da transação, informando valor, pagador e recebedor, é necessário também que haja a garantia de que Alice ao ter transferido uma quantia de dinheiro para Carlos, não possa transferir essa mesma quantia para outra pessoa, ou seja, é necessário impedir o gasto duplo. Em um sistema tradicional essa verificação ficaria a cargo de um agente central que seria o responsável por verificar se uma transação pode ocorrer e de registrá-la em um livro-razão, que pode ser armazenada em bases de dados tanto físicas quanto digitais.

Mas a partir do momento que se dá a uma entidade ou indivíduo o poder de manipular transações, problemas de confiança surgem: será que o agente central não está usando esse poder para benefício próprio? Será que o agente central é capaz de garantir a segurança das informações que ele detém?

A criação de um livro-razão público resolveria o problema de gasto duplo sem a necessidade de um agente central, já que qualquer um poderia verificar se uma transação já foi feita antes de aceitar uma nova, porém a capacidade de qualquer agente poder registrar uma transação no livro-razão cria o *Problema dos Generais Bizantinos*.

\citeauthoronline{byzantine} formalizaram em \citeyear{byzantine} o *Problema dos Generais Bizantinos*. Esse problema é apresentado por uma história fictícia de um exército bizantino acampado ao redor de uma cidade inimiga. O exército é composto por diversas divisões, cada uma comandada por um general, e a comunicação entre os generais só pode ocorrer por meio de troca de mensagens entre si.

O exército deve decidir por usar um plano de ação único, porém deve-se considerar que dentre os generais pode haver traidores. Assim, o problema é caracterizado por: \cite{byzantine}

i. Todos os generais leais devem adotar um mesmo plano de ação;
ii. Um grupo pequeno de traidores não pode conseguir que os generais leais adotem um plano de ação ruim.

Nesse problema teórico computacional, todos os generais leais farão o que o algoritmo implementado disser, porém, os traidores utilizarão qualquer outro algoritmo com o objetivo de chegar a uma ação considerada ruim para os interesses do exército.

Como \citeauthoronline{byzantine} explicitam, o algoritmo utilizado pelos generais leais devem garantir a condição (i) independente do que os traidores fizerem, e os generais leais não apenas devem chegar a um acordo sobre o que fazer, como também devem chegar a um acordo sobre um plano de ação razoável, ou em outras palavras, benéfico para o exército bizantino.

Para resolver o *Problema dos Generais Bizantinos* no contexto de registro de transações em um livro-razão público, é necessário considerar as seguintes características desse livro-razão:

1. O livro-razão pode ser escrito por qualquer um, ou seja, não existe um agente central que define quem pode escrever no livro-razão;
2. O livro-razão deve impedir o gasto duplo;
3. Todos os participantes não-fraudulentos devem concordar que o conteúdo do livro-razão é o correto e único aceito;

A terceira característica remete ao *Problema dos Generais Bizantinos*. A primeira característica se opõe a qualquer tipo de regulação centralizada, enquanto que a segunda característica garante que esse livro-razão possa ser utilizado como um sistema de transações financeiras confiável.

Para garantir a terceira característica, a simples votação entre os participantes, solução tradicional proposta por \citeauthoronline{byzantine}, não seria suficiente pois não há como impedir que novos participantes entrem no sistema, o que tornaria fácil a multiplicação artificial de agentes fraudulentos, que invariavelmente conseguiriam se tornar a maioria e consequentemente obteriam sucesso em fraudar o livro-razão.

Por isso \citeauthoronline{bitcoin} propôs a utilização de um algoritmo de prova de trabalho (*PoW - Proof of Work*) para registrar uma transação no livro-razão, inspirado pelo trabalho de \citeauthoronline{hashcash}. De forma simplificada, a prova de trabalho obriga que qualquer agente que queira escrever no livro-razão seja obrigado a calcular uma função *hash*, que é computacionalmente dispendiosa e cujo resultado é probabilisticamente difícil de ser o correto (apenas quem calcula um resultado correto consegue escrever no livro-razão).

Além do trabalho despendido para escrever uma transação no livro-razão, seja ela uma transação fraudulenta ou não, os agentes não-fraudulentos apenas confiarão no livro-razão mais extenso, ou seja, a única forma de enganar os participantes não-fraudulentos seria os fraudadores possuírem mais poder de processamento do que todos os participantes não-fraudulentos juntos. Quanto mais participantes não-fraudulentos entram neste processo de escrita concorrente, mais improvável de ocorrer torna-se uma fraude, e mais caro torna-se tentar fraudar o livro-razão.

Para que o livro-razão fosse público, distribuído, descentralizado e digital, \citeauthoronline{bitcoin} descreveu um sistema *peer-to-peer*\footnote{\emph{peer-to-peer} (p2p - ponto-a-ponto) é o nome que se dá a uma arquitetura de rede distribuída em que os participantes compartilham parte de seus recursos de \emph{hardware} (poder de processamento, capacidade de armazenamento, etc) para outros \emph{peers} (pontos) diretamente, sem passar por entidades intermediárias. Esses recursos compartilhados são necessários para prover o serviço e/ou conteúdo oferecido pela rede, e cada participante dessa rede é ao mesmo tempo provedor e consumidor de recursos \apud{kellerer}{p2p}.} em que as transações seriam registradas em blocos, e em que cada novo bloco dependeria do bloco anteriormente registrado (fig. \ref{fig:blockchain}), criando uma *blockchain*. Esse sistema teria as seguintes características:

\begin{figure}[htbp]
  \caption{\label{fig:blockchain}Arquitetura da \emph{blockchain}}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/blockchain.png}
  \end{center}
  \legend{Fonte: \citeonline{zheng2017overview}.}
\end{figure}

1. Novas transações deverão ser transmitidas para todos os nós (participantes) da rede;
2. Cado nó reúne as novas transações em um único bloco;
3. Cada nó tenta realizar uma prova de trabalho válida para o seu bloco;
4. Quando um nó encontra uma prova de trabalho válida ele transmite o bloco para todos os nós da rede;
5. Os nós da rede apenas aceitam o novo bloco se todas as transações contidas nesse bloco forem válidas e já não tiverem sido gastas;
6. Os nós expressam sua aceitação ao novo bloco trabalhando para criar o próximo bloco da *blockchain* usando o *hash* do bloco aceito como o *hash* anterior do bloco a qual estão trabalhando (fig. \ref{fig:prev-hash}).

\begin{figure}[htbp]
  \caption{\label{fig:prev-hash}O próximo bloco a ser criado deve conter o hash do último bloco aceito como válido.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/prev-hash.png}
  \end{center}
  \legend{Fonte: \citeonline{bitcoin}.}
\end{figure}

Se dois nós transmitirem versões diferentes do próximo bloco, ou seja, se forem criado dois blocos válidos ao mesmo tempo (um chamado de *U4* e outro de *B4*), os demais nós da rede sempre trabalharão em cima do primeiro bloco que receberem. Esse acontecimento causaria a criação de duas ramificações concorrentes da *blockchain*, uma contendo *U4* como último bloco, e outra contendo *B4* como último bloco (fig. \ref{fig:long-branch}). Porém, a partir do momento que uma dessas ramificações se tornar maior (em número de blocos registrados) do que a outra, todos os nós que estiverem trabalhando na ramificação menor automaticamente abandonarão essa ramificação em detrimento da ramificação maior \cite{bitcoin}.

\begin{figure}[htbp]
  \caption{\label{fig:long-branch}Disputa entre duas ramificações da \emph{blockchain}.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/long-branch.png}
  \end{center}
  \legend{Fonte: \citeonline{zheng2017overview}.}
\end{figure}

Mesmo considerando um cenário probabilístico em que dezenas de ramificações concorrentes surjam simultaneamente, como é altamente improvável que haja sempre o mesmo número de nós trabalhando em cada ramificação, a *blockchain* sempre tenderá a longo prazo a se manter com apenas uma ramificação.

Como já discutido no *Problema dos Generais Bizantinos*, mesmo que um grupo de nós decida deliberadamente não obedecer esse algoritmo, eles apenas teriam sucesso em convencer os demais nós de que a sua ramificação fraudulenta da *blockchain* é a verdadeira, caso tivessem um poder de processamento maior do que a maioria dos nós não-fraudulentos.

Para que esse sistema seja viável é necessário que haja diversos nós, sendo que quanto maior for a quantidade de nós na rede, maior será a impossibilidade de fraudar a *blockchain*, por isso, \citeauthoronline{bitcoin} especificou que a primeira transação de cada bloco seria uma transação que cria unidades de *Bitcoin*\footnote{A primeira transação de cada bloco da \emph{blockchain} do \emph{Bitcoin} serve como uma recompensa para quem criou o bloco. Inicialmente a recompensa era de 50 unidades de \emph{Bitcoin} (BTC 50,00), e a cada 210 mil blocos gerados (o que leva aproximadamente 4 anos) a recompensa é reduzida pela metade. Até junho de 2019 essa recompensa era de 12.5 BTC \cite{dev-ref}.}, que passa a ser de propriedade do criador do bloco, sendo a única forma de criar unidades de *Bitcoin*. Isso remove completamente a figura de bancos centrais, que em moedas fiduciárias são responsáveis por emitir novas unidades de dinheiro.

O *Bitcoin*, assim como o *Bit Gold* foi concebido com a ideia de imitar o padrão ouro, e por isso foi estipulado em seu protocolo que deverá ser emitido um máximo de 21 milhões de unidades de *Bitcoin*. E para que haja um incentivo para que participantes continuem adicionando blocos na *blockchain* mesmo quando o limite de 21 milhões de unidade for alcançado, também foi concebido em seu protocolo que cada transação processada paga uma taxa para o nó que registrou o novo bloco de transações na *blockchain* \cite{better}.

Para que seja permitido o registro de transações com frações de *Bitcoin*, cada transação (fig. \ref{fig:transaction-fraction}) é composta por entradas e saídas. Deve haver em cada transação uma ou mais entradas (isso permite que haja a junção de várias pequenas quantidades de *Bitcoins* para totalizar o valor a ser transferido para o recebedor) e uma ou duas saídas (uma para pagar o recebedor e outra para o troco, caso exista) \cite{transaction-guide}.

\begin{figure}[htbp]
  \caption{\label{fig:transaction-fraction}Composição de uma transação na \emph{blockchain}.}
  \begin{center}
  \includegraphics[width=0.85\textwidth]{imagens/transaction-fraction.png}
  \end{center}
  \legend{Fonte: \citeonline{bitcoin}.}
\end{figure}

\begin{figure}[htbp]
  \caption{\label{fig:transaction-ex}Exemplo de sequência de transações.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/transaction-ex.png}
  \end{center}
  \legend{Fonte: \citeonline{blockchain-guide}.}
\end{figure}

A figura \ref{fig:transaction-ex} mostra um exemplo de uma sequência de seis transações:

- Alice utiliza seus 10 mil *satoshis* na transação 0;
  - Bob recebe 40 mil *satoshis* de Alice;
  - 50 mil *satoshis* voltam para Alice como troco;
  - 10 mil *satoshis* ficam com o minerador\footnote{\emph{Minerador} é o dispositivo (nó) ou indivíduo que possuí esse dispositivo, que minera um novo bloco (cria um novo bloco na \emph{blockchain}) \cite{bitcoin-glossary}.} como taxa de transação\footnote{A taxa de transação é a diferença entre entrada e saída de uma transação, sendo um valor variável que depende do tamanho (em \emph{bits}) da transação.}.
- Bob gasta seus 40 mil *satoshis* na transação 1;
  - Carlos recebe 30 mil *satoshis* de Bob;
  - 10 mil *satoshis* ficam com o minerador como taxa de transação.
- Carlos gasta seus 30 mil *satoshis* na transação 3;
  - Denis recebe 20 mil *satoshis* de Carlos e os mantém sem gastá-los;
  - 10 mil *satoshis* ficam com o minerador como taxa de transação.
- Alice utiliza seus 50 mil *satoshis* na transação 2;
  - Eduardo recebe 20 mil *satoshis* de Alice;
  - 20 mil *satoshis* voltam para Alice como troco;
  - 10 mil *satoshis* ficam com o minerador como taxa de transação.
- Eduardo gasta seus 20 mil *satoshis* na transação 4;
  - Fernando recebe 10 mil *satoshis* de Eduardo;
  - 10 mil *satoshis* ficam com o minerador como taxa de transação.
- Alice gasta seus 20 mil *satoshis* na transação 5;
  - Gustavo recebe 10 mil *satoshis* de Alice;
  - 10 mil *satoshis* ficam com o minerador como taxa de transação.
- Fernando e Gustavo gastam cada um 10 mil *satoshis* na transação 6;
  - Hélio recebe 10 mil *satoshis*, 5 mil oriundos de Fernando e 5 mil oriundos de Gustavo. Hélio não gasta os 10 mil *satoshis* que recebeu;
  - 10 mil *satoshis* ficam com o minerador como taxa de transação.

Cada *output* (saída) de uma transação é oriundo de um *input* (entrada) de uma transação anterior e só pode ser utilizado em uma única transação, o que garante que não haja gasto duplo. Um *output* que não vira *input* para outra transação é, portanto, um valor não gasto, sendo denominado neste cenário um *UTXO* (*Unspent Transaction Output* - Saída de Transação não Gasta).

\begin{figure}[htbp]
  \caption{\label{fig:publichash}Processo de Geração do \emph{Public Key Hash}.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/publichash.png}
  \end{center}
  \legend{Fonte: \citeonline{transaction-guide}.}
\end{figure}

Cada *UTXO* contém um valor em *satoshi* disponível para ser gasto e um *Public Key Hash*. O *Public Key Hash* de um *UTXO* também é conhecido como *Redeem Script Hash*, que é um *hash* produzido a partir da chave pública do proprietário do *UTXO* (fig. \ref{fig:publichash}). Quando o dono do *UTXO* desejar gastar seu *UTXO* ele deve utilizar sua chave privada junto com um *script* denominado *Full Redeem Script* que ao ser aplicado no *Public Key Hash* do *UTXO*, liberá-o para ser gasto em uma nova transação. O *Public Key Hash* é único para cada *UTXO* e apenas a chave privada que o originou é capaz de gastá-lo (fig. \ref{fig:output}) \cite{transaction-guide}.

\begin{figure}[htbp]
  \caption{\label{fig:output}Gasto de um \emph{Output}.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/output.png}
  \end{center}
  \legend{Fonte: \citeonline{transaction-guide}.}
\end{figure}

\begin{figure}[htbp]
  \caption{\label{fig:block}Estrutura de um bloco da \emph{blockchain}.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/block.png}
  \end{center}
  \legend{Fonte: \citeonline{zheng2017overview}.}
\end{figure}

O bloco (fig. \ref{fig:block}) armazenado na *blockchain* além de conter as transações nele registradas, contém \cite{dev-ref}:

- *Contador de Transações*: o número de transações registradas no bloco;
- *Versão do Bloco*: a versão das regras de validação ao qual o bloco obedece. Isso permite que o protocolo do *Bitcoin* evolua mantendo a compatibilidade com blocos antigos. A versão atualmente utilizada nos novos blocos é a versão 4;
  - Versão 1: introduzida no *Bloco Gênesis* da *blockchain*, em janeiro de 2009;
  - Versão 2: introduzida em setembro de 2012;
  - Versão 3: introduzida em fevereiro de 2012;
  - Versão 4: introduzida em novembro de 2015.
- *Time Stamp* (Marcação de Tempo): data e hora em que o bloco foi criado. Deve ser estritamente maior do que a média das marcações de tempo dos últimos 11 blocos da *blockchain*;
- *Hash do Último Bloco*: contém o *hash* do último bloco adicionado na *blockchain*. Isso permite que a partir de qualquer bloco consiga-se acessar o bloco anterior, característica comum de uma estrutura de dados simplesmente encadeada.
- *Merkle Tree Root Hash*: *hash* gerado a partir dos *hashes* de todas as transações registradas no bloco. Isso garante que qualquer alteração nas transações do bloco seja facilmente identificada e rejeitada por outros nós da rede, impedindo fraudes nas transações;
- *Nonce*: um número arbitrário utilizado para que seja possível realizar a prova de trabalho;
- *nBits*: é o valor limite a qual o resultado do algoritmo de prova de trabalho deve ser inferior para ser considerado válido.

O *Merkle Tree Root Hash* (fig. \ref{fig:hashtree}) é uma estrutura de dados em árvore em que os nós superiores são calculados a partir do valor dos nós inferiores. Isso garante que qualquer alteração no conteúdo dos nós inferiores seja facilmente identificada. Esse mecanismo permite que blocos antigos que já tiveram suas transações válidas por diversos nós possam ter suas transações descartadas pelos mineradores para reduzir espaço em disco mas sem comprometer o algoritmo de validação do bloco.

\begin{figure}[htbp]
  \caption{\label{fig:hashtree}Estrutura de um \emph{Merkle Tree Root Hash}.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/hashtree.png}
  \end{center}
  \legend{Fonte: \citeonline{bitcoin}.}
\end{figure}

No caso do protocolo do *Bitcoin*, o processo de formação do \emph{Merkle Tree Root Hash} segue os seguintes passos (fig. \ref{fig:merkle}) \cite{dev-ref}:

1. As transações são ordenadas seguindo algumas regras\footnote{a transação \emph{coinbase}, transação responsável por criar bitcoin e recompensar o minerador, é sempre a primeira transação, e as demais transações devem ser ordenadas de forma a garantir que as transações de saída (\emph{UTXO}), transações não gastas, sejam posicionadas antes de outras transações no mesmo bloco em que essa mesma transação seja gasta como entrada de uma transação.};
2. É gerado o *hash* de cada transação a partir do *id* da mesma e utilizando o algoritmo *SHA256*;
3. Os *hashes* são agrupadas em pares, caso sobre um *hash* sem um par, ele é duplicado;
4. Os *hashes* dos pares são concatenados e novamente é aplicado o algoritmo *SHA256* para gerar um novo *hash*;
5. Os passos 3 e 4 é repetido até que sobre apenas um *hash*, esse *hash* é denominado \emph{Merkle Tree Root Hash}, e é então guardado no cabeçalho do bloco.

\begin{figure}[htbp]
  \caption{\label{fig:merkle}Exemplo de Formação do \emph{Merkle Tree Root Hash}.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/merkle.png}
  \end{center}
  \legend{Fonte: \citeonline{dev-ref}.}
\end{figure}

Um bloco só pode ser inserido na *blockchain* caso o minerador conclua a prova de trabalho, que, no protocolo do *Bitcoin*, é realizada aplicando a função *hash SHA256* no *time stamp* e no *nonce* do bloco, porém, o *hash* resultante só será aceito caso ele tenha um valor estritamente inferior ao especificado no campo *nBits*. Caso o *hash* gerado seja igual ou superior ao *nBits*, ele deve ser descartado, como mostrado na figura \ref{fig:hashcalc}.

\begin{figure}[htbp]
  \caption{\label{fig:hashcalc}Cálculo da Prova de Trabalho.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/hashcalc.png}
  \end{center}
  \legend{Fonte: \citeonline{surveyblockchain}.}
\end{figure}

Como a *função hash* produz um resultado imprevisível, a única forma de achar um resultado que satisfaça essa condição é através de força bruta. Porém, é importante salientar que uma vez encontrado um *hash* que satisfaça a condição, qualquer outro nó pode facilmente verificar se a solução encontrada é verdadeira. Sendo assim, a prova de trabalho é, com o perdão da redundância, trabalhosa porém facilmente verificável.

Pelo fato de a função *hash* sempre produzir o mesmo resultado quando aplicada a um mesmo valor, o *nonce* deve ser incrementado sempre que a tentativa de produzir um *hash* válido falhar. Em último caso, caso todas as tentativas possíveis falhem em produzir um *hash* válido, o *time stamp* pode ser atualizado para que se continue fazendo novas tentativas \cite{surveyblockchain}.

O *nBits* foi especificado para ser um valor variável, permitindo equilibrar a dificuldade de se encontrar um resultado válido. Ou seja, quanto maior for o valor do *nBits*, probabilisticamente menos tentativas serão necessárias para que se encontre uma solução para a prova de trabalho, e quanto menor ele for, probabilisticamente mais tentativas serão necessárias para encontrar uma solução \cite{dev-ref}.

Sempre que 2016 blocos são adicionados à *blockchain*, a rede de nós calcula quanto tempo se passou entre a criação do primeiro e do último bloco desses 2016 blocos e então o *nBits* é recalculado. O tempo ideal estipulado pelo protocolo é que demore exatamente 1.209.600 segundos (duas semanas) para que 2016 blocos sejam gerados. Caso tenha se demorado mais do que duas semanas para produzir os 2016 blocos, o valor do *nBits* é diminuído, e caso tenha-se demorado menos do que duas semanas, o valor do *nBits* é aumentado.

Essa característica de alterar o *nBits* para garantir que a quantidade de blocos gerados em duas semanas seja, em média, sempre igual, permite que o protocolo possa ser utilizado mesmo com o aumento da capacidade de processamento da rede. Quanto mais poder computacional for inserido na rede, mais difícil se tornará de calcular a prova de trabalho, sendo o inverso também verdade.

O primeiro bloco de *Bitcoin*, o Bloco Gênesis, foi minerado em 2009 pelo próprio \citeauthoronline{bitcoin}, sendo incorporado na *transação coinbase*\footnote{\emph{transação coinbase} é o nome dado a primeira transação de cada bloco que, como já discutido no texto, serve como recompensa para quem minerou o bloco. A \emph{transação coinbase} possui um campo de 100 bytes denominado \emph{coinbase script} que pode ser utilizados arbitrariamente pelo minerador sem que o protocolo \emph{Bitcoin} seja violado.} do bloco, o texto **The Times 03/Jan/2009 Chancellor on brink of second bailout for banks** \cite{genesis} em referência a uma manchete do jornal londrino Times sobre a falha do governo britânico de estimular a economia. A figura \ref{fig:times} mostra uma foto da edição do jornal da qual a frase foi retirada.

\begin{figure}[htbp]
  \caption{\label{fig:times}Foto da Edição de 03 de janeiro de 2009 do Jornal \emph{The Times}.}
  \begin{center}
  \includegraphics[width=1.0\textwidth]{imagens/times.png}
  \end{center}
  \legend{Fonte: \citeonline{timesimg}.}
\end{figure}.

O *Bitcoin* foi criado para se tornar uma moeda descentralizada e livre do poder estatal, e o texto publicado no *Bloco Gênesis*, bem como o fato do *Bitcoin* ter sido lançado em meio a crise financeira que começou em 2008, demonstra o seu objetivo de ser uma moeda concorrente a todas as moedas fiduciárias atualmente em circulação.

O livre mercado só é plenamente possível em um ambiente livre de coerção, em que os indivíduos se sintam livres para realizar trocas voluntárias e que não possam ser ameaçados ou inibidos por forças centralizadoras. O uso de moedas fiduciárias em espécie permite que transações livre de interferências estatais ocorram, porém, na era da conectividade em tempo real é necessário que haja uma moeda digital que garanta ou ao menos melhore a privacidade dos indivíduos que desejem realizar trocas voluntárias.
