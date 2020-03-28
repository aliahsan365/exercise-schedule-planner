
El comando (probado) para ejecutar un juego de pruebas generado, en caso
que se tenga ambos Python 2 y Python 3, es:

python2 mypython.py > jp_py.pddl; ff -o domain_ext3.pddl -f jp_py.pddl



En caso de que sólo se disponga de Python 2, el comando (no probado)
es:

python mypython.py > jp_py.pddl; ff -o domain_ext3.pddl -f jp_py.pddl