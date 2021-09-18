unit Vectores;

interface
Uses SysUtils, Math;

Type
  oVector = Object
    Private
      Items: Array Of LongInt;
      Tamaño: LongInt;
    Public
      Procedure Dimensionar(aSize: LongInt);
      Procedure CargaRandom(aDesde, aHasta: LongInt; PermiteRepetidos: Boolean);
      Function Sumatoria(): Double;
      Function Maximo(Var Posicion: LongInt): LongInt;
      Function Minimo(Var Posicion: LongInt): LongInt;
      Function Promedio(): Double;
      Function RetornarString(Separador: String): String;
      Function Multiplicar(aEscalar: Integer): oVector;
      Function SumarVectores(Var aVector: oVector): oVector;
      Function GetValue(Posicion: LongInt): LongInt;
      Procedure SetValue(Posicion: LongInt; Valor: LongInt);
      Function Buscar(Valor: LongInt): LongInt;
      Function TamañoVector(): LongInt;
  End;


implementation

Procedure oVector.Dimensionar(aSize: LongInt);
Begin
  SetLength(Items,aSize);
  Tamaño := aSize;
End;

Procedure oVector.CargaRandom(aDesde, aHasta: LongInt; PermiteRepetidos: Boolean);
Var I: LongInt;
    X: LongInt;
Begin
  Randomize;

  I := 0;
  while I < Tamaño do Begin
    X := Random(aHasta - aDesde) + aDesde;
    if PermiteRepetidos then Begin
      Items[I] := X;
      Inc(I);
    End
    Else Begin
      if Buscar(X) < 0 then Begin
        Items[I] := X;
        Inc(I);
      End;
    End;

  end;
End;

Function oVector.Sumatoria(): Double;
Begin

End;

Function oVector.Maximo(Var Posicion: LongInt): LongInt;
Begin

End;

Function oVector.Minimo(Var Posicion: LongInt): LongInt;
Begin

End;

Function oVector.Promedio(): Double;
Begin

End;

Function oVector.RetornarString(Separador: String): String;
Var
  I: LongInt;
  S: String;
Begin
  S := '';
  for I := 0 to Tamaño-1 do Begin
    if S = '' then S := Items[I].ToString
    Else S := S + Separador + Items[I].ToString;
  end;
  RetornarString := S;
End;

Function oVector.Multiplicar(aEscalar: Integer): oVector;
Begin

End;

Function oVector.SumarVectores(Var aVector: oVector): oVector;
Begin

End;

Function oVector.GetValue(Posicion: LongInt): LongInt;
Begin
  GetValue := Items[Posicion];
End;

Procedure oVector.SetValue(Posicion: LongInt; Valor: LongInt);
Begin

End;

Function oVector.Buscar(Valor: LongInt): LongInt;
Var I: LongInt;
Begin
  Buscar := -1;
  for I := 0 to Tamaño-1 do Begin
    if Items[I] = Valor then Begin
      Buscar := I;
      Exit;
    End;
  end;
End;

Function oVector.TamañoVector(): LongInt;
Begin
  TamañoVector := Tamaño;
End;

end.
