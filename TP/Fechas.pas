unit Fechas;

interface

Uses
  SysUtils,System.DateUtils;
Type
  Fecha = Object
  Private
    Error: Boolean;
    F: TDate;
  Public
  Procedure CargaFecha(Ingreso:String);
  Function ValidaFecha(): Boolean;
  Function SumarDias(Ingreso: Integer): String;
  Function RestarDias(Ingreso: Integer): String;
  Function MayorMenor(Fecha1,Fecha2:TDate): String;
  Function EsBisiesto(Ingreso: TDate): Boolean;
  Function RestaFechas(Fecha1,Fecha2:String): String;
  End;
implementation
//CARGA FECHA
  Procedure Fecha.CargaFecha(Ingreso:String);
    Begin
      try
        F := strToDate(Ingreso);
        Error := False;
      except
        on exception do
          Error := True;
      end;
    End;
//VALIDA FECHAS
  Function Fecha.ValidaFecha():Boolean;
  Begin
    ValidaFecha := Error;
  End;
//SUMA RESTA DIAS
//SUMA
  Function Fecha.SumarDias(Ingreso: Integer): String;
  Var I: TDate;
      S: String;
  begin
    I := F;
    S := DateToStr(I + Ingreso);
    SumarDias := S;
  end;
//RESTA
  Function Fecha.RestarDias(Ingreso: Integer): String;
  Var I: TDate;
      S: String;
  begin
    I := F;
    S := DateToStr(I - Ingreso);
    RestarDias := S;
  end;
//RESTA FECHAS
  Function Fecha.RestaFechas(Fecha1: string; Fecha2: string):String;
  Var S: String;
  begin
    S := Trunc((strToDate(Fecha1))-(strToDate(Fecha2))).ToString;
    RestaFechas := S;
  end;
//FECHA MAYOR O MENOR
  Function Fecha.MayorMenor(Fecha1,Fecha2:TDate): String;
  Var S: String;
      I: Integer;
  Begin
    I := Trunc(Fecha1-Fecha2);
    if I > 0 then begin
      S := 'Fecha 1 mayor a fecha 2';
    end else begin
      if I = 0 then begin
        S := 'Ambas fechas son iguales';
      end else
        S := 'Fecha 2 mayor a fecha 1';
    end;
    MayorMenor := S;
  End;
//ES BISIESTO
  Function Fecha.EsBisiesto(Ingreso: TDate): Boolean;
  Begin
    if IsInLeapYear(Ingreso) then
      EsBisiesto := True
    else
      EsBisiesto := False;
  End;
end.
