object frmFuncionarios: TfrmFuncionarios
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Funcion'#225'rios'
  ClientHeight = 582
  ClientWidth = 727
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lblNome: TLabel
    Left = 8
    Top = 336
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object lblNomeSocial: TLabel
    Left = 8
    Top = 368
    Width = 70
    Height = 15
    Caption = 'Nome Social:'
  end
  object lblSexo: TLabel
    Left = 203
    Top = 400
    Width = 27
    Height = 15
    Caption = 'Sexo:'
  end
  object lblDataNascimento: TLabel
    Left = 205
    Top = 437
    Width = 110
    Height = 15
    Caption = 'Data de Nascimento:'
  end
  object lblEmail: TLabel
    Left = 8
    Top = 465
    Width = 37
    Height = 15
    Caption = 'E-Mail:'
  end
  object lblCPF: TLabel
    Left = 569
    Top = 400
    Width = 24
    Height = 15
    Caption = 'CPF:'
  end
  object lblFone: TLabel
    Left = 569
    Top = 432
    Width = 29
    Height = 15
    Caption = 'Fone:'
  end
  object lblEndereco: TLabel
    Left = 8
    Top = 502
    Width = 52
    Height = 15
    Caption = 'Endere'#231'o:'
  end
  object lblMunicipio: TLabel
    Left = 8
    Top = 526
    Width = 57
    Height = 15
    Caption = 'Munic'#237'pio:'
  end
  object lblUF: TLabel
    Left = 261
    Top = 526
    Width = 17
    Height = 15
    Caption = 'UF:'
  end
  object lblCEP: TLabel
    Left = 438
    Top = 526
    Width = 24
    Height = 15
    Caption = 'CEP:'
  end
  object btnSubmeter: TButton
    Left = 537
    Top = 560
    Width = 88
    Height = 25
    Caption = 'Submeter'
    ModalResult = 1
    TabOrder = 19
    OnClick = btnSubmeterClick
  end
  object btnLimparCampos: TButton
    Left = 631
    Top = 560
    Width = 88
    Height = 25
    Caption = 'Limpar Campos'
    ModalResult = 4
    TabOrder = 20
    OnClick = btnLimparCamposClick
  end
  object edNome: TEdit
    Left = 64
    Top = 336
    Width = 655
    Height = 23
    TabOrder = 5
  end
  object edNomeSocial: TEdit
    Left = 84
    Top = 365
    Width = 635
    Height = 23
    TabOrder = 6
  end
  object rgNomeSocial: TRadioGroup
    Left = 8
    Top = 397
    Width = 169
    Height = 57
    Caption = 'Prefere ser chamada(o) pelo:'
    TabOrder = 7
  end
  object rbNome: TRadioButton
    Left = 16
    Top = 412
    Width = 62
    Height = 17
    Caption = 'Nome'
    TabOrder = 8
  end
  object rbNomeSocial: TRadioButton
    Left = 16
    Top = 435
    Width = 93
    Height = 17
    Caption = 'Nome Social'
    TabOrder = 9
  end
  object cbSexo: TComboBox
    Left = 241
    Top = 397
    Width = 145
    Height = 23
    TabOrder = 10
    Items.Strings = (
      'Prefiro N'#227'o Informar'
      'Masculino'
      'Feminino')
  end
  object meDataNascimento: TMaskEdit
    Left = 321
    Top = 429
    Width = 65
    Height = 23
    EditMask = '99/!99/0000;'
    MaxLength = 10
    TabOrder = 12
    Text = '  /  /    '
  end
  object edEmail: TEdit
    Left = 64
    Top = 463
    Width = 655
    Height = 23
    TabOrder = 14
  end
  object meCPF: TMaskEdit
    Left = 599
    Top = 397
    Width = 120
    Height = 23
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 11
    Text = '   .   .   -  '
  end
  object meFone: TMaskEdit
    Left = 602
    Top = 429
    Width = 117
    Height = 23
    EditMask = '!\(99\)0-0000-0000;1;_'
    MaxLength = 15
    TabOrder = 13
    Text = '(  ) -    -    '
  end
  object pnlCadastroDeFuncionarios: TPanel
    Left = 8
    Top = 6
    Width = 711
    Height = 37
    Caption = 'C A D A S T R O   D E   F U N C I O N '#193' R I O S'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = -63
      Width = 711
      Height = 37
      Caption = 'INSCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object dbgFuncionarios: TDBGrid
    Left = 0
    Top = 53
    Width = 719
    Height = 193
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBNavigator: TDBNavigator
    Left = 229
    Top = 256
    Width = 240
    Height = 25
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = -16
    Top = 287
    Width = 735
    Height = 37
    Caption = 'INSCRI'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Panel3: TPanel
      Left = 0
      Top = -63
      Width = 711
      Height = 37
      Caption = 'INSCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object edEndereco: TEdit
    Left = 64
    Top = 494
    Width = 655
    Height = 23
    TabOrder = 15
  end
  object edMunicipio: TEdit
    Left = 64
    Top = 523
    Width = 166
    Height = 23
    TabOrder = 16
  end
  object cbUF: TComboBox
    Left = 284
    Top = 523
    Width = 145
    Height = 23
    TabOrder = 17
    Items.Strings = (
      'Acre - AC'
      'Alagoas - AL'
      'Amap'#225' - AP'
      'Amazonas - AM'
      'Bahia - BA'
      'Cear'#225' - CE'
      'Distrito Federal - DF'
      'Esp'#237'rito Santo - ES'
      'Goi'#225's - GO'
      'Maranh'#227'o - MA'
      'Mato Grosso - MT'
      'Mato Grosso do Sul - MS'
      'Minas Gerais - MG'
      'Par'#225' - PA'
      'Para'#237'ba - PB'
      'Paran'#225' - PR'
      'Pernambuco - PE'
      'Piau'#237' - PI'
      'Rio de Janeiro - RJ'
      'Rio Grande do Norte RN'
      'Rio Grande do Sul - RS'
      'Rond'#244'nia - RO'
      'Roraima - RR'
      'Santa Catarina - SC'
      'S'#227'o Paulo - SP'
      'Sergipe - SE'
      'Tocatins - TO')
  end
  object meCEP: TMaskEdit
    Left = 481
    Top = 523
    Width = 114
    Height = 23
    EditMask = '00000\-999;1;_'
    MaxLength = 9
    TabOrder = 18
    Text = '     -   '
  end
  object btnCadastrarNovoCancelar: TButton
    Left = 475
    Top = 256
    Width = 110
    Height = 25
    Caption = 'Cadastrar Novo'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnCadastrarNovoCancelarClick
  end
end
