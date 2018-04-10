This Scilab code generates GDGP instances. The 3D structure of a molecule instance is defined in
terms of its \textit{internal coordinates} given by the lengths of the%
\textit{\ covalent bonds} $d_{1,2},\ldots ,d_{n-1,n}$, by the \textit{%
covalent angles} $\theta _{1,3},\ldots ,\theta _{n-2,n}$ (formed by three
consecutive atoms), and by the \textit{torsion angles} $\omega _{1,4},\ldots
,\omega _{n-3,n}$ (formed by four consecutive atoms). Each torsion angle $%
\omega _{i-3,i}$ is the angle between the normals of the planes defined by
the atoms $i-3,i-2,i-1$ and $i-2,i-1,i$, respectively.

We fix the lengths of the covalent bonds (for example, $d_{i-1,i}=1.0$)\
and the values of the covalent angles (for example, $\theta _{i-2,i}=2.0$
radians). \ In this way, except for rotations, translations, and
reflections, a 3D molecular structure is determined by the torsion angles $%
\omega _{1,4},\ldots ,\omega _{n-3,n}\in \lbrack 0,2\pi ]$. A way to proceed
is to choose randomly values for $\omega _{i-3,i}\in \{\frac{\pi }{3},\pi ,%
\frac{5\pi }{3}\}$, as well as pairs of points $\{i,j\}$ whose Euclidean
distances $d_{i,j}$ are smaller than a given value.

we also define interval distances to $\{i,j\}$, where $|j-i|<3$, given by%
\begin{eqnarray*}
\underline{d}_{i,j} &=&d_{i,j}-radii1, \\
\overline{d}_{i,j} &=&d_{i,j}+radii1
\end{eqnarray*}%

The distances associated to pairs $\{i,j\}$, where $|j-i|\geq 3$,
 given by%
\begin{eqnarray*}1
\underline{d}_{i,j} &=&d_{i,j}-min\{radii2text{, }radii2d_{i,j}\}, \\
\overline{d}_{i,j} &=&d_{i,j}+min\{radii2\text{, }radii2d_{i,j}\},
\end{eqnarray*}%
