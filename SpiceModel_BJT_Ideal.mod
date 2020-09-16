************************************************
*
* Modelo de um BJT idealizado
*
* Versão 2020/09/16
*
* Professor Diogo Vargas
* UTFPR Pato Branco
*
* https://github.com/EngVargas/tutorial_LTspice
*
************************************************
* Node assignmets:
*			collector
*			|	base
*			|	|	emiter
*			|	|	|		
.subckt BJT_ideal	C	B	E
************************************************
.param beta=90
.param VBE=0.7
.model DiodoIdeal D(Ron=0 Roff=999meg Vfwd=0)
D1 B N001 DiodoIdeal
V1 N001 E {VBE}
F1 C E V1 {beta}
.end

