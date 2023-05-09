object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 552
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPedidoDeVendas: TLabel
    Left = 8
    Top = 26
    Width = 238
    Height = 16
    Caption = 'Pedido de Venda (Cabe'#231'a de Pedido)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbGridPedidosVendas: TDBGrid
    Left = 8
    Top = 48
    Width = 369
    Height = 193
    DataSource = DM.dsPedidoVenda
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnGerarPedido: TButton
    Left = 383
    Top = 48
    Width = 98
    Height = 25
    Caption = 'Gerar Pedido'
    TabOrder = 1
    OnClick = btnGerarPedidoClick
  end
  object btnExcluir: TButton
    Left = 383
    Top = 88
    Width = 98
    Height = 25
    Caption = 'Excluir Pedido'
    TabOrder = 2
    OnClick = btnExcluirClick
  end
end
