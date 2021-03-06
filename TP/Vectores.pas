unit Vectores;

interface

  Uses
    sysUtils;
  Const
    Min = 1;
    Max = 10;
  Type
    Vector = Object
      Private
        Items: Array[Min..Max] of LongInt;
      Public
        Procedure CargaAleatoria(RangoDesde, RangoHasta: LongInt; PermiteRepetidos: Boolean);
        Function Buscar(Valor: LongInt): LongInt;
        Function Mayor():String;
        Function Menor():String;
        Function Promedio(): Double;
        Function MultiplosDe(Valor_x_Multiplo: LongInt; Separador: String): String;
        Function RetornaString(Separador: String): String;
        Function RetornaArreglo(I: Integer): LongInt;
        Function RetornaMax(): Integer;
        Function Sumatoria(): Double;
        Function Suma(Var a: Vector; Var b: Vector; Separador: String): String;
    End;
implementation
  //CARGA ALEATORIA
  Procedure Vector.CargaAleatoria(RangoDesde, RangoHasta: LongInt; PermiteRepetidos: Boolean);
  Var I: Integer;
      X: LongInt;
  Begin
    Randomize;
      I := 0;
      While I < Max do Begin
        X := RangoDesde + Random(RangoHasta);
        if PermiteRepetidos then Begin
          Items[I] := X;
        End Else Begin
          if Buscar(X) < 0 then Begin
            Items[I] := X;
            inc(I);
          End;
        End;
      End;
  End;

  Function Vector.Buscar(Valor: LongInt):LongInt;
  Var I: Integer;
    Begin
      Buscar := -1;
      for I := 0 to Max - 1 do Begin
        if Items[I] = Valor then Begin
          Buscar := I;
        End;
      End;
    End;

  Function Vector.Mayor():String;
    Var I,P: Integer;
        M: LongInt;
    Begin
      M := Items[Min];
      for I := Min to Max do Begin
        if Items[I] > M then Begin
          M := Items[I];
          P := I;
        End;
      End;
      Mayor := 'M?ximo: ' + M.ToString + '. Posici?n ' + P.ToString + ' arrancando de 0';
    End;
  Function Vector.Menor():String;
var
  I,P: Integer;
  Minimo: LongInt;
    Begin
      for I := 0 to Max - 1 do Begin
        if I = 0 then Begin
          Minimo := Items[I];
        End else Begin
          if Items[I] < Minimo then Begin
            Minimo := Items[I];
            P := I;
          End;
        End;
        Menor := 'M?nimo: ' + Minimo.ToString + '. Posici?n ' + P.ToString + ' arrancando de 0';
      End;
    End;
  Function Vector.Promedio(): Double;
    Begin
      Promedio := Sumatoria / ( Max - Min + 1);
    End;
  Function Vector.MultiplosDe(Valor_x_Multiplo: LongInt; Separador: String): String;
    Var I: Integer;
        S: String;
        V: Array[Min..Max] of LongInt;
    Begin
      for I := 0 to Max - 1 do Begin
        V[I] := Items[I];
        Items[I] := Items[I] * Valor_x_Multiplo;
      End;
      S := Vector.RetornaString(Separador);
      for I := 0 to Max - 1 do Begin
        Items[I] := V[I];
      End;
      MultiplosDe := S;
    End;

  Function Vector.RetornaString(Separador: String): String;
    Var I: Integer;
        S: String;
    Begin
      for I := 0 to Max -1 do Begin
        if S = '' then
          S := Items[I].ToString
        else
          S := S + Separador + Items[I].ToString;
      End;
      RetornaString := S;
    End;

  Function Vector.RetornaArreglo(I: Integer): LongInt;
    begin
      RetornaArreglo := Items[I];
    end;

  Function Vector.RetornaMax():Integer;
    begin
      RetornaMax := Max;
    end;

  Function Vector.Sumatoria(): Double;
    Var I: Integer;
        S: Double;
  begin
    for I := 0 to Max -1 do Begin
      S := S + Items[I];
    end;
    Sumatoria := S;
  end;

  Function Vector.Suma(Var a: Vector; Var b: Vector; Separador: String):String;
    Var I: Integer;
        S: String;
        VAux,VResul: Array[Min..Max] of LongInt;
    Begin
      for I := 0 to Max - 1 do Begin
        VAux[I] := Items[I];
        Items[I] := a.RetornaArreglo(I);
      End;
      S := RetornaString(Separador) + #13#10 + ' + ' + #13#10;
      for I := 0 to Max -1 do Begin
        Items[I] := b.RetornaArreglo(I);
      End;
      S := S + RetornaString(Separador) + #13#10 + ' = ' + #13#10;
      for I := 0 to Max - 1 do Begin
        Items [I] := a.RetornaArreglo(I) + b.RetornaArreglo(I);
      End;
      S := S + RetornaString(Separador);
      for I := 0 to Max - 1 do Begin
        Items[I] := VAux[I];
      End;
      Suma := S;
    End;
end.
