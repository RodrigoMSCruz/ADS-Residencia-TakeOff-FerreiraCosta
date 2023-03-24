object frmPratica01: TfrmPratica01
  Left = 0
  Top = 0
  Caption = 'Pratica01'
  ClientHeight = 294
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblNome: TLabel
    Left = 8
    Top = 136
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object lblSexo: TLabel
    Left = 8
    Top = 184
    Width = 27
    Height = 15
    Caption = 'Sexo:'
  end
  object pnlPratica1: TPanel
    Left = 0
    Top = 8
    Width = 625
    Height = 57
    Caption = 'Pr'#225'tica 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 72
    Top = 133
    Width = 497
    Height = 23
    TabOrder = 1
    Text = 'edtNome'
  end
  object btnOK: TButton
    Left = 384
    Top = 261
    Width = 113
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnFechar: TButton
    Left = 507
    Top = 261
    Width = 113
    Height = 25
    Caption = 'Fechar'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object cbxSexo: TComboBox
    Left = 72
    Top = 181
    Width = 145
    Height = 23
    TabOrder = 4
    Text = 'cbxSexo'
    Items.Strings = (
      'Masculino'
      'Feminino')
  end
end
