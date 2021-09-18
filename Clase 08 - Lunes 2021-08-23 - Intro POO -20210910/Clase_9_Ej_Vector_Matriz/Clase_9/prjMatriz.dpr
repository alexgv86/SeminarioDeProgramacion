program prjMatriz;

uses
  Vcl.Forms,
  TestMatriz in 'TestMatriz.pas' {Form1},
  Matriz in 'Matriz.pas',
  Vectores in 'Vectores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
