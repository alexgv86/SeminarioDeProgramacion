unit Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, NumeroBinario;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var B: oBinario;
begin
  memo1.Clear;
  B.SetValue(edit1.Text);
  memo1.Lines.Add('Valor Ingresado: ' + B.GetValue);
end;

procedure TForm1.Button2Click(Sender: TObject);
Var B1: oBinario;
    B2: oBinario;
begin
  memo1.Clear;
  B1.SetValue(edit1.Text);
  B2.SetValue(edit2.Text);
  memo1.Lines.Add(' Binario 1:  ' + B1.GetValue);
  memo1.Lines.Add(' Binario 2:  ' + B2.GetValue);
  memo1.Lines.Add(' B1 AND B2:  ' + B1.Y_And(B2).GetValue);
  memo1.Lines.Add(' B1 OR  B2:  ' + B1.O_Or(B2).GetValue);
end;

end.
