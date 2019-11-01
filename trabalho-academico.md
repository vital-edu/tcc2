# Holochain

# Projeto

## Oportunidade de Negócio

O crescente endividamento do governo americando \ref{fig:usdebt} em conjunto com a diminuição do poder de compra do dólar \ref{fig:usprice} serve como um indicativo de preocupação sobre uma das principais características necessárias a uma moeda: a reserva de valor \textcolor{red}{[citar Mises]}.

\begin{figure}[htbp]
    \caption{\label{fig:usdebt}Dívida do governo dos EUA entre 1942 e 2019.}
    \begin{center}
    \includegraphics[width=1.0\textwidth]{imagens/usdebt.png}
    \end{center}
    \legend{Fonte: \citeauthoronline{usdebt}.}
\end{figure}

\begin{figure}[htbp]
    \caption{\label{fig:usprice}Poder de compra do dólar entre 1913 e 2019.}
    \begin{center}
    \includegraphics[width=1.0\textwidth]{imagens/usprice.png}
    \end{center}
    \legend{Fonte: \citeauthoronline{usprice}.}
\end{figure}

Hayek \textcolor{red}{[citar apropriadamente essa afirmação]} atribui o constante endividamento do governo e a alteração artificial da taxa de juros pelo governo como fatores precursores para grandes crises e depressões mundiais como as que ocorreram em 2007-2008. 

O Bitcoin foi criado com a intenção de prover uma moeda decentraalizada que não pudesse ser inflacionada \textcolor{red}{ [definir o conceito de inflação segundo a escola austríaca de economia][citar Satoshi Nakamoto e o seu White Paper] } de forma descontrolada, tendo um limite de 21 milhões de unidades, as quais não podem ser superadas. 

Essa característica provê ao Bitcoin uma vantagem sobre o dólar e outras moedas fiduciárias \textcolor{red}{[definir o que é uma moeda fiduciária]}, principalmente em crises e em momentos de grande depreciação das moedas. 

Aliado a isso, o crescente aumento do uso de comércio eletrônico para a compra de produtos e serviços \textcolor{red}{[citar dados sobre o crescimento do comércio eletrônico]} cria um ambiete propício para a criação de uma plataforma que una o comércio eletrônico com um meio de pagamento que não sofra interferência de nenhum governo ou entidade central.

Além da desvalorização das moedas fiduciárias, os govenos também coletam impostos sobre os produtos comercializados e impedem que determinadas transações sejam realizadas, por considerá-las ilegais ou legais apenas após serem fiscalizadas por orgãos regulatórios.

O caráter lícito ou ilícito de uma transação pode ser inspecionado sobre a ótica da lei vigente de um país (juspositivismo \textcolor{red}{[definir o que é juspositivismo]}), ou através de meios éticos \textcolor{red}{[definir que a ética é a busca pelo certo e errado]}, derivando a lei através do jusnaturalismo)\textcolor{red}{[explicar]} ou jusracionalismo)\textcolor{red}{[citar a ética argumentativa de Hans-Hermann Hoppe]}.

Olhando pela ótica jusnaturalista, pode-se chegar a conclusões de que tanto o imposto como a proibição e interferência do governo ou qualquer outro agente central em uma transação é inválida, e caracteriza-se como uma violação da liberdade individual dos indivíduos.

Partindo do princípio que não estamos discutindo a licitude dos atos pela ótica da lei do estado e sim pela ótica da lei natural )\textcolor{red}{[citar Frederic Bastiat (a lei foi corrompida)]}, podemos focar em como criar esse ambiente de livre mercado em que a liberdade dos indivíduos é soberana.

Embora existam plataformas de comércio eletrônico na chamada *deep web* )\textcolor{red}{[explicar o que é deep web]} que passam despercebidas das ações governamentais, há uma carência de uma plataforma de comércio eletrônico amplamente acessível e que utilize de moedas não controladas por governos e que sejam resistentes a agentes centrais.

Até pouco tempo atrás, tais plataformas eram inconcebíveis de serem criadas, porém, com o advento do Bitcoin, da *blockchain* e dos chamados *smart contracts* )\textcolor{red}{[definir o que é blockchain e smart contracts]}, passou a ser viável tais plataformas.

Porém, as plataformas existentes são desconhecidas ou inexistentes. Tal constatação pode ser explicada, embora sem rigor técnico, pelo modelo de negócio de tais plataformas, que no geral, criam novos *tokens* \textcolor{red}{[explicar o que são tokens]} ao invés de se basearem nas criptomoedas já consolidadas do mercado, além de utilizarem da mesma *blockchain* do Bitcoin, que conforme mostrado na \textcolor{red}{figura X [citar dados de performance da blockchain]} não consegue escalar.

O problema de performance da *blockchain* é devido a necessidade de todos os agentes da rede terem que possuir o mesmo dado \textcolor{red}{[explicar melhor]}, assim, a adição de mais um nó na rede, não aumenta sua performance.

A *Holochain* surgiu como uma alternativa a *blockchain* baseando-se na tecnologia *DHT*
\textcolor{red}{[explicar]}. Assim ao invés dos dados serem idênticos para todos os nós da rede, eles são distribuídos de forma randômica entre os nós com um número de cópias suficientemente grande para garantir que o dado esteja sempre disponível mesmo quando o detentor original do dado está indisponível na rede.

\begin{figure}[htbp]
    \caption{\label{fig:diff}Diferença entre client/server, Blockchain e Holochain.}
    \begin{center}
    \includegraphics[width=1.0\textwidth]{imagens/diff.png}
    \end{center}
    \legend{Fonte: \citeauthoronline{coreconcept}.}
\end{figure}

\begin{figure}[htbp]
    \caption{\label{fig:holoarchitecture}Arquitetura de uma aplicação Holochain (hApp).}
    \begin{center}
    \includegraphics[width=1.0\textwidth]{imagens/holoarchitecture.png}
    \end{center}
    \legend{Fonte: \citeauthoronline{thebasics}.}
\end{figure}

\begin{figure}[htbp]
    \caption{\label{fig:communicationholo}Interação entre hApps.}
    \begin{center}
    \includegraphics[width=1.0\textwidth]{imagens/communicationholo.png}
    \end{center}
    \legend{Fonte: \citeauthoronline{holoarchitecture}.}
\end{figure}

# Requísitos de Software