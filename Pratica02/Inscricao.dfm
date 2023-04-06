object frmInscricao: TfrmInscricao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Inscri'#231#227'o'
  ClientHeight = 268
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 48
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 70
    Height = 15
    Caption = 'Nome Social:'
  end
  object lblSexo: TLabel
    Left = 227
    Top = 112
    Width = 27
    Height = 15
    Caption = 'Sexo:'
  end
  object lblDataNascimento: TLabel
    Left = 229
    Top = 149
    Width = 110
    Height = 15
    Caption = 'Data de Nascimento:'
  end
  object lblEmail: TLabel
    Left = 32
    Top = 177
    Width = 37
    Height = 15
    Caption = 'E-Mail:'
  end
  object lblCPF: TLabel
    Left = 482
    Top = 112
    Width = 24
    Height = 15
    Caption = 'CPF:'
  end
  object lblFone: TLabel
    Left = 483
    Top = 144
    Width = 29
    Height = 15
    Caption = 'Fone:'
  end
  object Button1: TButton
    Left = 474
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 557
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
  end
  object edNome: TEdit
    Left = 88
    Top = 45
    Width = 545
    Height = 23
    TabOrder = 2
  end
  object edNomeSocial: TEdit
    Left = 108
    Top = 77
    Width = 525
    Height = 23
    TabOrder = 3
  end
  object rgNomeSocial: TRadioGroup
    Left = 32
    Top = 109
    Width = 169
    Height = 57
    Caption = 'Prefere ser chamada(o) pelo:'
    TabOrder = 4
  end
  object rbNome: TRadioButton
    Left = 40
    Top = 124
    Width = 62
    Height = 17
    Caption = 'Nome'
    TabOrder = 5
  end
  object rbNomeSocial: TRadioButton
    Left = 40
    Top = 147
    Width = 93
    Height = 17
    Caption = 'Nome Social'
    TabOrder = 6
  end
  object cbSexo: TComboBox
    Left = 265
    Top = 109
    Width = 145
    Height = 23
    TabOrder = 7
    Text = 'cbSexo'
    Items.Strings = (
      'Prefiro N'#227'o Informar'
      'Masculino'
      'Feminino')
  end
  object meDataNascimento: TMaskEdit
    Left = 345
    Top = 141
    Width = 65
    Height = 23
    EditMask = '99/!99/0000;'
    MaxLength = 10
    TabOrder = 8
    Text = '  /  /    '
  end
  object Edit1: TEdit
    Left = 88
    Top = 175
    Width = 370
    Height = 23
    TabOrder = 9
  end
  object meCPF: TMaskEdit
    Left = 512
    Top = 109
    Width = 120
    Height = 23
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 10
    Text = '   .   .   -  '
  end
  object meFone: TMaskEdit
    Left = 513
    Top = 141
    Width = 117
    Height = 23
    EditMask = '!\(99\)0-0000-0000;1;_'
    MaxLength = 15
    TabOrder = 11
    Text = '(  ) -    -    '
  end
  object pnlIscricao: TPanel
    Left = 40
    Top = -1
    Width = 593
    Height = 37
    Caption = 'INSCRI'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
end
