object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema - Acesso'
  ClientHeight = 366
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Header1: THeader
    Left = 0
    Top = 341
    Width = 518
    Height = 25
    Align = alBottom
    Sections.Sections = (
      #0'48'#0'(c) 2023'
      #0'132'#0'Ferreira Costa e Cia. Ltda'
      #0'32'#0'UNIT')
    TabOrder = 0
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 341
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Label2: TLabel
      Left = 104
      Top = 151
      Width = 53
      Height = 23
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMsg: TLabel
      Left = 104
      Top = 296
      Width = 281
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 104
      Top = 71
      Width = 45
      Height = 23
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtSenha: TEdit
      Left = 104
      Top = 180
      Width = 281
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 207
      Top = 232
      Width = 74
      Height = 41
      Caption = 'entrar'
      TabOrder = 3
      OnClick = btnOkClick
    end
    object btnSair: TButton
      Left = 288
      Top = 232
      Width = 97
      Height = 41
      Caption = '&sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
    object CheckBox1: TCheckBox
      Left = 399
      Top = 189
      Width = 50
      Height = 17
      Caption = 'Mostrar'
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object edtEmail: TEdit
      Left = 104
      Top = 100
      Width = 281
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
