## Metodo dei minimi quadrati

Siamo interessati a cercare un polinomio di grado arbitrario che si discosti il meno possibile da un certo insieme di punti $(x_i, y_i)$ con $i =0,\ldots,n$.

Per semplificare la spiegazione, introdurremo l'argomento limitandoci alle rette (ovvero i polinomi di primo grado).
Esistono diversi **criteri** per poter stabilire quale sia la retta che, tra le tante, approssimi meglio i dati e uno dei più usati (anche in ambito statistico) è il così detto "***Metodo dei Minimi Quadrati***".

Si parte definendo un vettore detto "**residuo**", ottenuto dalle differenze tra ciascun punto e la retta approssimante:
$$
r_i\coloneqq y_i - mx_i - q
$$
Se i punti fossero tutti perfettamente allineati, ci si aspetterebbe una retta interpolante, con un apposito vettore residuo nullo:
$$
y_i-mx_i-q = 0
$$
Adesso cerchiamo la retta per cui la somma del quadrato dei residui è minima:
$$
min \sum_{i=0}^{n} [y_i - (mx_i + q)]^2
$$
Per riscrivere questa formula in modo più rigoroso, è possibile usare un piccolo escamotage sintattico:
$$
\sum_{i=0}^{n} \left[ y_i - (mx_i + q) \right]^2 \leq \sum_{i=0}^{n} \left[ y_i - p(x_i) \right]^2
\quad \forall p \in P_1
$$
Dove $P_1$ non è altro che l'insieme dei polinomi di primo grado.

> [!Approfondimento per chi è più curiosə]
> Il motivo per cui usiamo il *quadrato dei residui* (e non direttamente i residui stessi), è dato da diverse ragioni:
> 1) Nulla vieta che la differenza tra l'ordinata di un punto e la retta ideale sia negativa; quindi, siccome siamo interessati al valore numerico di questa differenza e non al suo segno, possiamo elevare al quadrato, liberandoci della fatidica gestione di eventuali valori assoluti.
> 2) Se la differenza tra un punto e la retta cercata è "piccola", significa che avremo sbagliato "di poco". Al contrario, se un punto distasse molto dalla retta, l'errore commesso sarebbe notevole. Questo significa che, elevando al quadrato, possiamo *penalizzare* maggiormente i punti distanti, rispetto a quelli vicini alla retta.
>    Infatti, elevando un numero alla seconda, geometricamente è come se stessimo calcolando l'area del quadrato avente come lato proprio questo valore e, al raddoppiare della lunghezza di un lato, non corrisponde un raddoppio dell'area del quadrato, bensì un **quadruplico**!
>    Questo ci permette di assegnare un peso crescente agli errori più grandi, rendendo il metodo dei minimi quadrati particolarmente sensibile alle deviazioni più significative:
>    
>    ![[images/quadrati.svg]]
> 
> 3) Tra poco vedremo che sarà necessario calcolare delle derivate e, da un punto di vista meramente algebrico, risulta molto facile determinare la derivata di una potenza, tramite la nota formula:
> $$
> \frac{d}{dx} f(x)^\alpha = \alpha f(x)^{\alpha-1} f'(x)
> $$
> 

Ora sviluppiamo i calcoli dell'equazione, eseguendo il quadrato del trinomio:
$$\sum_{i=0}^{n} (y_i - mx_i - q)^2$$
$$\downarrow$$
$$\sum_{i=0}^{n} (y_i^2 -\bcancel{mx_iy_i} - \bcancel{y_iq} - \bcancel{- mx_iy_i} + m^2x_i^2 + \bcancel{mx_iq} - \bcancel{y_iq} + \bcancel{mx_iq} + q^2)$$
$$\downarrow$$
$$\sum_{i=0}^{n} (y_i^2 - 2mx_iy_i - 2y_iq + m^2x_i^2 + 2mx_iq + q^2) = \Phi(m,q)$$

$\Phi(m,q)$ di fatto non è altro che una particolare funzione detta *paraboloide* di grado 2 con incognite $m$ e $q$.
Graficamente ce la si può immaginare come una parabola in 3 dimensioni, rivolta verso l'alto:

![[images/paraboloide.svg]]

Di questa funzione siamo interessati a trovare il punto di minimo (che è unico), in quanto quella sarà la combinazione ottimale di $m$ e $q$ tale da avere l'errore, tra i dati e la retta, più basso possibile e approssimare al meglio i dati.

Analogamente a quanto accadeva nel calcolo con 1 variabile quando, per trovare il punto di minimo di una funzione bastava azzerare la derivata prima, adesso si deve fare lo stesso ma con le *derivate parziali* (siccome $\Phi$ non dipende più da un solo parametro, bensì 2).

Per calcolare le derivate parziali, denotate con $\displaystyle\frac{\partial funzione}{\partial varibile}$, la procedura non è molto diversa rispetto al solito:
1) Prima di tutto bisogna scegliere una variabile rispetto alla quale derivare ($m$ oppure $q$).
2) Trattiamo tutte le altre variabili come se fossero costanti.
3) Applichiamo le classiche regole di derivazione (derivata del prodotto, derivata della somma, derivata di funzioni composte, ecc...).

La derivata rispetto ad $m$ è quindi:
$$
\frac{\partial \Phi}{\partial m} = \sum_{i=0}^{n} (2x_i^2m + 2x_iq -2x_iy_i)
$$
Mentre quella rispetto a $q$ è:
$$
\frac{\partial \Phi}{\partial q} = \sum_{i=0}^{n} (2q + 2mx_i - 2y_i)
$$
Non ci resta che azzerare le due derivate parziali e metterle a sistema:
$$
\begin{cases}
\displaystyle \frac{\partial \Phi}{\partial m} = 0 \\[1em]
\displaystyle \frac{\partial \Phi}{\partial q} = 0
\end{cases}
\xRightarrow{\text{sostituisco}}
\begin{cases}
\displaystyle \sum_{i=0}^{n} (2x_i^2m + 2x_iq -2x_iy_i) = 0 \\[1em]
\displaystyle \sum_{i=0}^{n} (2q + 2mx_i - 2y_i) = 0
\end{cases}
\xRightarrow{\text{semplifico}}
\begin{cases}
\displaystyle \sum_{i=0}^{n} (\bcancel{2}x_i^2m + \bcancel{2}x_iq -\bcancel{2}x_iy_i) = \frac{0}{\bcancel2} \\[1em]
\displaystyle \sum_{i=0}^{n} (\bcancel{2}q + \bcancel{2}mx_i - \bcancel{2}y_i) = \frac{0}{\bcancel2}
\end{cases}

$$
Da $\displaystyle \frac{\partial \Phi}{\partial q}$ è possibile ricavare $m$ distribuendo la sommatoria su ogni termine: $$m \displaystyle = \frac{\displaystyle \sum_{i=0}^{n}{y_i} - q \ (n+1)} { \displaystyle \sum_{i=0}^{n}{x_i}}$$
> Il motivo per cui da $\displaystyle \sum_{i=0}^{n}{q}$ si passa a $q\cdot (n+1)$ è legato al fatto che $q$ è una costante e per questo può essere portata fuori dal segno di sommatoria:$$q\displaystyle \sum_{i=0}^{n}{1}$$ e siccome la sommatoria varia da $i=0$ fino a $i=n$, è come se stessimo sommando $1$ a sé stesso $n+1$ volte:
$$\sum_{i=0}^{n} 1 = \underbrace{1 + 1 + \ldots + 1 }_{n+1 \text{ volte}} = 1 \cdot (n + 1) = n+1$$

Da $\displaystyle \frac{\partial \Phi}{\partial m}$ è invece possibile ricavare $q$ in modo analogo:
$$
q = \frac{\displaystyle \sum_{i=0}^{n}{\left(x_i y_i\right)} - m\sum_{i=0}^{n}{x_i^2}}{\displaystyle \sum_{i=0}^{n}{x_i}}
$$
> Per migliorare la leggibilità delle espressioni, d'ora in poi, quando vedrete il simbolo di sommatoria $\displaystyle \sum{}$ saranno sottintesi gli indici $\displaystyle \sum_{i=0}^{n}$ .

Il sistema è quindi ora diventato: $$\begin{cases}
q = \frac{\displaystyle \sum{\left(x_i y_i\right)} - m\sum{x_i^2}}{\displaystyle \sum{x_i}} \\[1em]
m = \frac{\displaystyle \sum{y_i} - q \ (n+1)} { \displaystyle \sum{x_i}}
\end{cases}$$
Per risolverlo, è possibile sostituire l'equazione di $m$ dentro a quella di $q$ :
$$q = \frac{\displaystyle \sum{\left(x_i y_i\right)} - \frac{\displaystyle \sum{y_i} - q \ (n+1)} { \displaystyle \sum{x_i}}\sum{x_i^2}}{\displaystyle \sum{x_i}}$$
Per agevolare la leggibilità, moltiplico entrambi i membri per i dovuti termini in modo da far sparire i denominatori:
$$q  \sum{x_i}= \frac{\displaystyle \sum{\left(x_i y_i\right)} - \frac{\displaystyle \sum{y_i} - q \ (n+1)} { \displaystyle \sum{x_i}}\sum{x_i^2}}{\displaystyle \bcancel{\sum{x_i}}} \bcancel{\sum{x_i}}$$
$$\downarrow$$
$$q  \sum{x_i} = \displaystyle \sum{\left(x_i y_i\right)} - \frac{\displaystyle \sum{y_i} - q \ (n+1)} { \displaystyle \sum{x_i}}\sum{x_i^2}$$
$$\downarrow$$
$$q \ \left(\sum{x_i}\right)^2 = \frac{\displaystyle \sum{x_i}\sum{\left(x_i y_i\right)} - \sum{x_i^2}\displaystyle \sum{y_i} + q \ (n+1)\sum{x_i^2}} {\bcancel{\displaystyle \sum{x_i}}} \bcancel{\displaystyle \sum{x_i}}$$
$$\downarrow$$
$$q \ \left(\sum{x_i}\right)^2 = \displaystyle \sum{x_i}\sum{\left(x_i y_i\right)} - \sum{x_i^2}\displaystyle \sum{y_i} + q \ (n+1) \sum{x_i^2}$$
Raccolgo $q$ al primo membro dell'equazione e semplifico:
$$q \ \left(\sum{x_i}\right)^2 - q \ (n+1) \sum{x_i^2} = \displaystyle \sum{x_i}\sum{\left(x_i y_i\right)} - \sum{x_i^2}\displaystyle \sum{y_i}$$
$$\downarrow$$
$$q \ \left( \left(\sum{x_i}\right)^2 - (n+1) \sum{x_i^2} \right) = \displaystyle \sum{x_i}\sum{\left(x_i y_i\right)} - \sum{x_i^2}\displaystyle \sum{y_i}$$
$$\downarrow$$
$$q \ \bcancel{\left( \left(\sum{x_i}\right)^2 - (n+1) \sum{x_i^2} \right)} = \frac{\displaystyle \sum{x_i}\sum{\left(x_i y_i\right)} - \sum{x_i^2}\displaystyle \sum{y_i}}{\left(\displaystyle \sum{x_i}\right)^2 - (n+1) \displaystyle \sum{x_i^2}}$$
Per far tornare i conti con quanto visto a lezione, basta moltiplicare il secondo membro per $\displaystyle \frac{-1}{-1}$, in modo che le versioni combacino:
$$q = \frac{\displaystyle \sum{x_i}\sum{\left(x_i y_i\right)} - \sum{x_i^2}\displaystyle \sum{y_i}}{\left(\displaystyle \sum{x_i}\right)^2 - (n+1) \displaystyle \sum{x_i^2}}\displaystyle \left(\frac{-1}{-1}\right)$$
$$\downarrow$$
$$q = \frac{\displaystyle \sum{x_i^2}\displaystyle \sum{y_i} -\displaystyle \sum{x_i}\sum{\left(x_i y_i\right)}}{(n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2}$$
Trovata quindi l'equazione di $q$, è ora possibile sostituirla all'interno dell'equazione di $m$ calcolata precedentemente:

$$m \displaystyle = \frac{\displaystyle \sum{y_i} - \frac{\displaystyle \sum{x_i^2}\displaystyle \sum{y_i} -\displaystyle \sum{x_i}\sum{\left(x_i y_i\right)}}{(n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2} \ (n+1)} { \displaystyle \sum{x_i}}$$
$$\downarrow$$
$$m = \frac{\bcancel{(n+1)\displaystyle \sum{x_i^2}\displaystyle \sum{y_i}} - \displaystyle \sum{y_i} \left(\sum{x_i} \right)^\bcancel{2} - \bcancel{(n+1)\sum{x_i}^2 \sum{y_i}} + (n+1) \displaystyle \bcancel{\sum{x_i}} \sum{\left(x_i y_i\right)}}{\displaystyle \bcancel{\sum{x_i}} \left( (n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2\right)}$$
$$\downarrow$$
$$m = \frac{(n+1) \displaystyle \sum{\left(x_i y_i\right)} - \displaystyle \sum{x_i} \sum{y_i}}{ (n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2}$$
Ecco quindi la soluzione finale del sistema:$$\begin{cases}
q = \frac{\displaystyle \sum{x_i^2}\displaystyle \sum{y_i} -\displaystyle \sum{x_i}\sum{\left(x_i y_i\right)}}{\displaystyle(n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2} \\[1em]
m = \frac{\displaystyle(n+1) \displaystyle \sum{\left(x_i y_i\right)} - \displaystyle \sum{x_i} \sum{y_i}}{ \displaystyle (n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2}
\end{cases}$$
La retta che ha $m$ come coefficiente angolare e $q$ come termine noto prende il nome di "**Retta di regressione lineare**", esplicitamente è:
$$y = \frac{\displaystyle(n+1) \displaystyle \sum{\left(x_i y_i\right)} - \displaystyle \sum{x_i} \sum{y_i}}{ \displaystyle (n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2} \ x\ + \frac{\displaystyle \sum{x_i^2}\displaystyle \sum{y_i} -\displaystyle \sum{x_i}\sum{\left(x_i y_i\right)}}{\displaystyle(n+1) \displaystyle \sum{x_i^2} - \left(\displaystyle \sum{x_i}\right)^2}$$
