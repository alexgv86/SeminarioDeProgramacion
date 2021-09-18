unit EjPOO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vectores;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  V: oVector;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
  I: LongInt;

begin
  V.Dimensionar(10);
  V.CargaRandom(10, 100, False);
  memo1.Lines.Add(V.RetornarString(' | '));

  for I := 0 to V.TamañoVector - 1 do Begin
    memo1.Lines.Add('V[' + I.ToString + '] = ' + V.GetValue(I).ToString);
  end;

end;

end.
