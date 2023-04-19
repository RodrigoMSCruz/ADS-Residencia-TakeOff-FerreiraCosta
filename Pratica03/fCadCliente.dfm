object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 745
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 876
    Height = 704
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    object Label1: TLabel
      Left = 56
      Top = 88
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 56
      Top = 128
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label3: TLabel
      Left = 56
      Top = 176
      Width = 81
      Height = 13
      Caption = 'Data Nascimento'
    end
    object Label4: TLabel
      Left = 56
      Top = 219
      Width = 33
      Height = 13
      Caption = 'Celular'
    end
    object Label5: TLabel
      Left = 56
      Top = 267
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label6: TLabel
      Left = 53
      Top = 320
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label7: TLabel
      Left = 53
      Top = 368
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label8: TLabel
      Left = 56
      Top = 416
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 56
      Top = 472
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object edtNome: TEdit
      Left = 184
      Top = 85
      Width = 385
      Height = 21
      TabOrder = 0
    end
    object edtEmail: TEdit
      Left = 184
      Top = 125
      Width = 385
      Height = 21
      TabOrder = 1
    end
    object edtCelular: TMaskEdit
      Left = 184
      Top = 216
      Width = 385
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
    end
    object edtCEP: TMaskEdit
      Left = 184
      Top = 264
      Width = 380
      Height = 21
      EditMask = '!00000-000;0;_'
      MaxLength = 9
      TabOrder = 4
      Text = ''
    end
    object edtEndereco: TEdit
      Left = 181
      Top = 317
      Width = 385
      Height = 21
      TabOrder = 5
    end
    object edtBairro: TEdit
      Left = 181
      Top = 365
      Width = 385
      Height = 21
      TabOrder = 6
    end
    object edtCidade: TEdit
      Left = 181
      Top = 413
      Width = 385
      Height = 21
      TabOrder = 7
    end
    object cbxUF: TComboBox
      Left = 184
      Top = 469
      Width = 382
      Height = 21
      TabOrder = 8
      Items.Strings = (
        'PE'#11
        'PB')
    end
    object DBGrid1: TDBGrid
      Left = 53
      Top = 536
      Width = 780
      Height = 120
      DataSource = dsCliente
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object edtDtNasc: TMaskEdit
      Left = 184
      Top = 173
      Width = 382
      Height = 21
      EditMask = '!99/99/0000;0;_'
      MaxLength = 10
      TabOrder = 2
      Text = ''
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 704
    Width = 876
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 440
    ExplicitTop = 368
    ExplicitWidth = 185
    object btnInserir: TButton
      Left = 416
      Top = 6
      Width = 75
      Height = 25
      Caption = 'inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnExcluir: TButton
      Left = 752
      Top = 6
      Width = 75
      Height = 25
      Caption = 'excluir'
      TabOrder = 1
      OnClick = btnExcluirClick
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 800
    Top = 488
  end
  object qryCliente: TFDQuery
    Connection = dmUsuario.dbConnMySQL
    Left = 816
    Top = 448
  end
  object insCliente: TFDQuery
    Connection = dmUsuario.dbConnMySQL
    Left = 816
    Top = 408
  end
  object delCliente: TFDQuery
    Connection = dmUsuario.dbConnMySQL
    Left = 816
    Top = 360
  end
end
