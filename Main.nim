import Window
import strutils
import os, math
import Horner
import Bernstein
import Curvas
import Casteljau
import FindSpan
import BasisFuns

#Window.main()
proc clearTerminal() =
    echo "\x1B[2J\x1B[H"

proc readInt(): int =
    var inputStr: string = ""
    while inputStr.len == 0:
        inputStr = readLine(stdin)
    result = parseInt(inputStr)

clearTerminal()

let n: int = 8

case n
of 1:
    clearTerminal()
    echo "1. A1.1 Horner"
    var a: seq[float64] = @[1.0, 2.0, 2.0, -3.0, -3.0, 4.0, -10.0, 4.1, -10.0]
    var u: float64 = 0.5
    echo Horner.horner(u, a), ",", a.len
of 2:
    clearTerminal()
    echo "2. A1.2 Bernstein"
    let i = 2
    let n = 5
    let u = 0.5
    let resultado = Bernstein.bernstein(i, n, u)
    echo "El resultado del polinomio de Bernstein es: ", resultado
of 3:
    clearTerminal()
    echo "3. A1.3 AllBernstein"
of 4:
    clearTerminal()
    echo "4. A1.5 deCasteljau"
    when isMainModule:
        let P: seq[(float, float)] = @[(0.0, 0.0), (1.0, 3.0), (2.0, 1.0), (3.0, 4.0)]  # Puntos de control
        let n = P.len - 1  # Grado de la curva de Bezier (número de puntos de control menos 1)
        let u = 0.2  # Valor del parámetro
        let C = Curvas.deCasteljau(P, n, u)
        echo "El punto en la curva de Bezier es: ", C
of 5:
    clearTerminal()
    echo "5. Implementar las curvas de Bezier"
    var t = 0.0 
    var xF: float
    var yF: float  

    for i in countup(1, 11):
        xF = Casteljau.bezier(0,4,t,'x')
        yF = Casteljau.bezier(0,4,t,'y')
        echo "Graficar punto en: ",round(xF,1), " ", round(yF,1)
        t = t + 0.1

of 6:
    clearTerminal()
    echo "6. A2.1 FindSpan"
    when isMainModule:
        let n = 5  # Número de nodos
        let p = 2  # Grado de la curva
        let u = 0.4  # Valor del parámetro
        let U = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 4.0, 4.0]  # Nodos
        let spanIndex = FindSpan.findSpan(n, p, u, U)
        echo "El índice del nudo encontrado es: ", spanIndex
of 7:
    clearTerminal()
    echo "7. A2.2 BasisFuns"
    when isMainModule:
        var U: seq[float64] = @[0.0,0.0,0.0,1.0,2.0,3.0,4.0,4.0,4.0,5.0,5.0,5.0]
        var p: int = 1
        var i: int = 4
        var u: float64 = 2.5
        let N = BasisFuns.basisFuns(i, u, p, U)
        echo "Funciones de base no nulas: ", N
of 8:
    clearTerminal()
    echo "8. Graficar cualquier curva de Bezier"
    Window.main()
else:
    clearTerminal()
    echo "Opcion no reconocida"
    



