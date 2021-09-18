unit NumeroBinario;

interface

Uses
  SysUtils;

Type
  Bases = 3..16;

  oBinario = Object
    Private
      Nro: Array[1..32] Of char;
    Public
      Procedure SetValue(aNro: String);
      Function GetValue(): String;
      Function SumarBinario(aNB: oBinario): oBinario;
      Function ConverToBase(aBase: Bases): String;
      Function Y_And(aNB: oBinario): oBinario;
      Function O_Or(aNB: oBinario): oBinario;
      Function X_Xor(aNB: oBinario): oBinario;
  End;

implementation

Procedure oBinario.SetValue(aNro: String);
Var I, J: Integer;
    C: Char;
Begin
  for I := 1 To 32 do
    Nro[I] := '0';

  J := 32;
  for I := 0 To aNro.Length-1 Do Begin
    Nro[J] := aNro[aNro.Length-I];
    Dec(J);
  End;
End;

Function oBinario.GetValue(): String;
Var S: String;
    I: Integer;
Begin
  S := '';
  for I := 1 to 32 do
    S := S + Nro[I];
  GetValue := S;
End;

Function oBinario.SumarBinario(aNB: oBinario): oBinario;
Begin

End;

Function oBinario.ConverToBase(aBase: Bases): String;
Begin

End;

Function oBinario.Y_And(aNB: oBinario): oBinario;
Var I: Integer;
    B: oBinario;
Begin
  for I := 1 to 32 do Begin
    if (Nro[I] = '1') And (aNB.Nro[I] = '1') then
      B.Nro[I] := '1'
    Else
      B.Nro[I] := '0';
  End;
  Y_And := B;
End;

Function oBinario.O_Or(aNB: oBinario): oBinario;
Var I: Integer;
    B: oBinario;
Begin
  for I := 1 to 32 do Begin
    if (Nro[I] = '1') Or (aNB.Nro[I] = '1') then
      B.Nro[I] := '1'
    Else
      B.Nro[I] := '0';
  End;
  O_Or := B;
End;

Function oBinario.X_Xor(aNB: oBinario): oBinario;
Begin

End;

end.
