# Holochain: código de experimentação
\label{lst:holochain}

\lstinputlisting[language=C, caption={Código exemplo em \emph{Holochain}}]{code/lib.rs}

# Arquitetura da aplicação desenvolvida utilizando a tecnologia Blockstack
\label{appendix:blockstack}

Para o desenvolvimento da aplicação descentralizada que utiliza a tecnologia *Blockstack* e a biblioteca *Radiks* foi utilizada a arquitetura de aplicação ilustrada pela figura \ref{fig:arch}.

\begin{figure}[htbp]
    \caption{\label{fig:arch}Arquitetura da aplicação.}
    \begin{center}
    \includegraphics[width=1.0\textwidth]{imagens/arch.png}
    \end{center}
\end{figure}

No passo 1, o cliente, que pode ser acessado por qualquer navegador, se comunica com o *Blockstack Browser* para que o usuário consiga realizar o *sign in* utilizando sua chave privada. Depois de ter fornecido suas credenciais, o *Blockstack Broser* valida as credenciais na *Blockchain* (passo 2), e a *blockchain* recupera os endereços dos ambientes de armazenamento do usuário através do *Gaia* (passo 3). Essas informações são retornadas para o *Blockstack Browser* (que também é apenas um cliente acessível pelo navegador), e é informado que a aplicação deseja ter permissão de leitura/escrita do usuário.

Após o usuário conceder as permissões da aplicação, é gerado um *token* único para a aplicação e uma chave privada gerada a partir da chave inicial do usuário. Esse *token* junto com a *chave privada da aplicação* são retornados para o cliente que os armazena no banco de dados local do navegador do usuário\footnote{\emph{local storage} (armazenamento local) é o nome do banco de dados \emph{offline} e desestruturado que vem embutido nos navegadores modernos e que permite que pequenas informações sejam armazenas e acessadas mesmo quando não há conexão com a \emph{internet}.}(passo 4).

Após esse processo o cliente está preparado para realizar operações e armazená-las na *blockchain da blockstack* e no gerenciador de armazenamento *Gaia* em nome do usuário. Isso já seria suficiente para que a aplicação funcionasse, no entanto, para permitir que nós (diferentes clientes) se comuniquem entre si é necessário que os nós se conheçam, o que requer a criação de um meio de indexação dos clientes da aplicação.

Isso é feito através do indexador *Radiks* que apresenta as seguintes características que o define como sendo um servidor de indexação descentralizado: \cite{radiks}

- Sem bloqueio de dados: o *Radiks* é apenas um indexador dos *hashes* dos documentos guardados através do *Gaia*. Mesmo que o indexador saia do ar, o usuário continua podendo ter o acesso aos seus dados, podendo copiá-lo ou movê-lo quando houver necessidade;
- Resistente a censura: como todo o dado é armazenado no *Gaia* e tem seus *hashes* registrados na *blockchain*, nenhum agente pode revogar o acesso ao dado de um usuário;
- Privacidade máxima: como os dados são ciptografados antes de serem enviados e armazenados tanto pelo *Radiks* quanto pelo *Gaia*, todas as informações privadas do usuário estão seguras.
- Criado utilizando autenticação descentralizada: o *Radiks* é fortemente atreleado ao sistema de autenticação da *Blockstack*, que utiliza *blockchain* e o sistema Gaia de forma a prover ao usuário controle total sobre a propriedade do dado e quem tem acesso a ele.

O sistema *Radiks* apenas armazena o *hashes* e *metadados* importantes das informações que necessitam ser armazenas pelo cliente na *blockchain* e permite que haja o armazenamento de dados que podem ser lidos e escritos em conjunto, o que permite que dois ou mais usuários possam, por exemplo, colaborativamente gerenciar um mesmo dado, uma característica importante em determinados contextos, como quando dois clientes precisam ser capazed de atualizar o *status* de uma compra.

Assim, o cliente se comunica com o *Radiks* (passo 5), que repassa os dados para a *blockchain* (passo 6), responsável por armazenar os dados no Gaia. Após a confirmação de que os dados foram armazenados, o *Radiks* indexa os dados e retorna a confirmação de sucesso para o cliente.

Um cliente pode utilizar diversos indexadores diferentes, o que permitira a criação de diversos servidores que poderiam servir como redes privadas ou secretas de clientes ou para que, por exemplo, um indexador Radiks fosse usado apenas por uma comunidade pequena no interior de São Paulo.
