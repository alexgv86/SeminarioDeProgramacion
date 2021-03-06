unit Matriz;

interface

Uses
  SysUtils, Math, Vectores;

Const
  Min = 1;
  Max = 10;

Type
  oMatriz = Object
    Private
      Items: Array[Min..Max, Min..Max] Of LongInt;
    Public
      Procedure Limpiar();
      Procedure CargarRandom(Desde, Hasta: Integer);
      Function SumarMatrices(Var aM: oMatriz): oMatriz;
      Function DiagonalPrincipal(): Vector;
      Function DiagonalOpuesta(): Vector;
      Function MaximaFila(): Vector;
      Function MaximaColumna(): Vector;
      Function MultiplicaEscalar(N: Integer): oMatriz;
      Function RetornarString(): String;
  End;


implementation

// Este procedure pone todos los elementos de la matriz en 0
Procedure oMatriz.Limpiar();
Var
  I, J: Integer;
begin
  for I := Min to Max do Begin
    for J:= Min to Max do Begin
      Items[I,J] := 0;
    End;
  End;
end;

// Carga con valores aleatorios entre Desde-hasta
Procedure oMatriz.CargarRandom(Desde, Hasta: Integer);
Var
  I, J: Integer;
Begin
  Randomize;
  for I := Min to Max do Begin
    for J := Min to Max do Begin
      Items[I,J] := Random(Hasta-Desde) + Desde;
    End;
  End;
End;

// Esta funcion suma elemento a elemento
// cada posicion de la matriz con la que recibe como parametro
Function oMatriz.SumarMatrices(Var aM: oMatriz): oMatriz;
Begin

End;

// retorna un vector con la diagonal principal.
// El vector es el definido en el punto 1
Function oMatriz.DiagonalPrincipal(): Vector;
Begin

End;

// retorna un vector con la diagonal opuesta.
// El vector es el definido en el punto 1
Function oMatriz.DiagonalOpuesta(): Vector;
Begin

End;

// retorna un vector con la fila maxima.
// La maxima fila es aquella cuya sumatoria es la mayor de todas las filas de la matriz
// El vector es el definido en el punto 1
Function oMatriz.MaximaFila(): Vector;
Begin

End;

// retorna un vector con la columna maxima.
// La maxima columna es aquella cuya sumatoria es la mayor de todas las columnas de la matriz
// El vector es el definido en el punto 1
Function oMatriz.MaximaColumna(): Vector;
Begin

End;

// retorna una nueva matriz donde cada elemento es multiplicado
// por "N" que es el escalar recibido como parametro.
Function oMatriz.MultiplicaEscalar(N: Integer): oMatriz;
Begin

End;

// retorna un string con cada valor de cada posicion
// Cada fila esta en la misma linea
Function oMatriz.RetornarString(): String;
Var
  I, J: Integer;
  S, SS: String;
Begin
  SS:= '';
  for I := Min to Max do Begin
    S := '';
    for J := Min to Max do Begin
      if S = ''  then S := Items[I,J].ToString
      Else S := S + ' | ' + Items[I,J].ToString;
    End;
    SS := SS + S + Chr(13) + Chr(10);
  End;
  RetornarString := SS;
End;

end.
