object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 476
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 168
    Top = 8
    Width = 577
    Height = 369
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 1
    Text = '10011'
  end
  object Button1: TButton
    Left = 8
    Top = 9
    Width = 145
    Height = 25
    Caption = 'Probar Binario'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 112
    Width = 145
    Height = 21
    TabOrder = 3
    Text = '01101'
  end
  object Button2: TButton
    Left = 8
    Top = 81
    Width = 145
    Height = 25
    Caption = 'Probar AND y OR con ...'
    TabOrder = 4
    OnClick = Button2Click
  end
end
