program prjPOO;

uses
  Vcl.Forms,
  EjPOO in 'EjPOO.pas' {Form1},
  Vectores in 'Vectores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
