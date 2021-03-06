unit EjPoo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vectores, Matriz, Fechas, Estacionamiento,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    EditFecha1: TEdit;
    ButtonValida: TButton;
    LabelErrorFecha: TLabel;
    ButtonSumaRestaFecha: TButton;
    PanelSumaResta: TPanel;
    Label6: TLabel;
    EditDiasSumaResta: TEdit;
    ComboSumaResta: TComboBox;
    Label7: TLabel;
    LabelSumaRestaResul: TLabel;
    LabelBisiesto: TLabel;
    ButtonBisiesto: TButton;
    ButtonMayorMenor: TButton;
    ButtonF1F2: TButton;
    PanelFecha2: TPanel;
    EditFecha2: TEdit;
    Label9: TLabel;
    LabelResulFecha: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonValidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSumaRestaFechaClick(Sender: TObject);
    procedure EditFecha1Change(Sender: TObject);
    procedure EditFecha2Change(Sender: TObject);
    procedure ButtonBisiestoClick(Sender: TObject);
    procedure ButtonMayorMenorClick(Sender: TObject);
    procedure ButtonF1F2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  F: Fecha;
  M1,M2: oMatriz;
  V,V1,V2: Vector;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var I: Integer;
    D: System.TDate;
    S: String;
begin
  Panel1.Hide;
  memo1.Show;
  memo1.Clear;

  V.CargaAleatoria(10, 50, False);
  memo1.Lines.Add('a)');
  for I := 0 to (V.RetornaMax() - 1) do Begin
    memo1.Lines.Add('V[' + I.ToString + ']: ' + V.RetornaArreglo(I).ToString);
  End;
  memo1.Lines.Add('');
  memo1.Lines.Add('b) Sumatoria: ' + V.Sumatoria.ToString);
  memo1.Lines.Add('c) ' + V.Mayor);
  memo1.Lines.Add('d) ' + V.Menor);
  memo1.Lines.Add('e) Promedio: ' + V.Promedio.ToString);
  memo1.Lines.Add('f) ' + V.RetornaString(' - '));
  memo1.Lines.Add('g) ' + V.MultiplosDe(2,' - '));
  V1.CargaAleatoria(10, 50, False);
  V2.CargaAleatoria(10, 50, False);
  memo1.Lines.Add('h) ' + #13#10 + V.Suma(V1, V2, ' - '));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Panel1.Hide;
  memo1.Show;
  memo1.Clear;
  M1.CargarRandom(0,10);
  memo1.Lines.Add(M1.RetornarString);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Hide;
  Panel1.Show;
end;

procedure TForm1.ButtonBisiestoClick(Sender: TObject);
begin
  LabelSumaRestaResul.Caption := '';
  EditDiasSumaResta.Text := '';
  //EditFecha2.Text := '';
  LabelResulFecha.Hide;
  if F.EsBisiesto(strToDate(EditFecha1.Text)) then Begin
    LabelBisiesto.Show;
    LabelBisiesto.Caption := 'Es bisiesto';
    LabelBisiesto.Font.Color := clGreen;
  End else Begin
    LabelBisiesto.Show;
    LabelBisiesto.Caption := 'NO es bisiesto';
    LabelBisiesto.Font.Color := clRed;
  End;
end;

procedure TForm1.ButtonF1F2Click(Sender: TObject);
  Var S: String;
begin
  S := EditFecha1.Text + ' - ' + EditFecha2.Text + ' = ';
  S := S + F.RestaFechas(EditFecha1.Text,EditFecha2.Text);
  if ((F.RestaFechas(EditFecha1.Text,EditFecha2.Text)) = '1') or ((F.RestaFechas(EditFecha1.Text,EditFecha2.Text)) = '-1') then begin
    S := S + ' d?a';
  end else
    S := S + ' d?as';

  LabelResulFecha.Caption := S;
  LabelResulFecha.Show;
end;

procedure TForm1.ButtonMayorMenorClick(Sender: TObject);
  Var S: String;
begin
  S := F.MayorMenor(strToDate(EditFecha1.Text),strToDate(EditFecha2.Text));
  LabelResulFecha.Caption := S;
  LabelResulFecha.Show;
end;

procedure TForm1.ButtonSumaRestaFechaClick(Sender: TObject);
Var S: String;
begin
EditFecha2.Text := '';
LabelResulFecha.Hide;
S := EditFecha1.Text;
if ComboSumaResta.ItemIndex = 0 then
  S := S + ' + ' + EditDiasSumaResta.Text + ' = ' + F.SumarDias(strToInt(EditDiasSumaResta.Text))
else
  S := S + ' - ' + EditDiasSumaResta.Text + ' = ' + F.RestarDias(strToInt(EditDiasSumaResta.Text));

LabelSumaRestaResul.Caption := S;
end;

procedure TForm1.ButtonValidaClick(Sender: TObject);
Var Fecha: String;
begin
  Fecha := EditFecha1.Text;
  F.CargaFecha(Fecha);
  LabelBisiesto.Hide;
  if F.ValidaFecha then Begin
    LabelErrorFecha.Font.Color := clRed;
    LabelErrorFecha.Caption := 'Ingrese una fecha v?lida';
    LabelErrorFecha.Show;
    PanelFecha2.Hide;
    PanelSumaResta.Hide;
    ButtonSumaRestaFecha.Hide;
    ButtonF1F2.Hide;
    ButtonMayorMenor.Hide;
    ButtonBisiesto.Hide;
  End Else Begin
    LabelErrorFecha.Font.Color := clGreen;
    LabelErrorFecha.Caption := 'Fecha v?lida';
    LabelErrorFecha.Show;
    PanelFecha2.Show;
    PanelSumaResta.Show;
    ButtonSumaRestaFecha.Show;
    ButtonF1F2.Show;
    ButtonMayorMenor.Show;
    ButtonBisiesto.Show;
  End;
end;

procedure TForm1.EditFecha1Change(Sender: TObject);
begin
  LabelErrorFecha.Hide;
  PanelSumaResta.Hide;
  LabelResulFecha.Hide;
  ButtonSumaRestaFecha.Hide;
  LabelSumaRestaResul.Caption := '';
  EditDiasSumaResta.Text := '';
  ButtonF1F2.Hide;
  ButtonMayorMenor.Hide;
  ButtonBisiesto.Hide;
  LabelBisiesto.Hide;
end;

procedure TForm1.EditFecha2Change(Sender: TObject);
begin
  LabelErrorFecha.Hide;
  PanelSumaResta.Hide;
  LabelResulFecha.Hide;
  ButtonSumaRestaFecha.Hide;
  LabelSumaRestaResul.Caption := '';
  EditDiasSumaResta.Text := '';
  ButtonF1F2.Hide;
  ButtonMayorMenor.Hide;
  ButtonBisiesto.Hide;
  LabelBisiesto.Hide;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboSumaResta.Style:=csDropDownList;
  ComboSumaResta.items.Add('+');
  ComboSumaResta.items.Add('-');
end;

end.
