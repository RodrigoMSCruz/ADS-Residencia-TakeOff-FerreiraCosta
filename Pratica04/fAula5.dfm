object frmAula5: TfrmAula5
  Left = 0
  Top = 0
  Caption = 'Sistema - Aula 5'
  ClientHeight = 381
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainMnu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 356
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
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
  end
  object Header1: THeader
    Left = 0
    Top = 356
    Width = 656
    Height = 25
    Align = alBottom
    Sections.Sections = (
      #0'48'#0'(c) 2023'
      #0'132'#0'Ferreira Costa e Cia. Ltda'
      #0'32'#0'UNIT')
    TabOrder = 1
  end
  object mainMnu: TMainMenu
    Left = 576
    Top = 280
    object File1: TMenuItem
      Caption = '&Cadastro'
      object Abrir1: TMenuItem
        Caption = 'Cliente'
        OnClick = Abrir1Click
      end
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      ShortCut = 32883
      OnClick = Sair1Click
    end
  end
end
