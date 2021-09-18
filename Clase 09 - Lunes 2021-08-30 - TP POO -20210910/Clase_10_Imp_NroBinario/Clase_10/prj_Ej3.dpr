program prj_Ej3;

uses
  Vcl.Forms,
  Ejercicio3 in 'Ejercicio3.pas' {Form1},
  NumeroBinario in 'NumeroBinario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
