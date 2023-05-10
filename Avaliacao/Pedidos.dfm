object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 552
  ClientWidth = 545
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
  object lblItensDePedido: TLabel
    Left = 8
    Top = 314
    Width = 101
    Height = 16
    Caption = 'Itens de Pedido'
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
    Width = 409
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
    Left = 439
    Top = 48
    Width = 98
    Height = 25
    Caption = 'Gerar Pedido'
    TabOrder = 1
    OnClick = btnGerarPedidoClick
  end
  object btnExcluir: TButton
    Left = 439
    Top = 88
    Width = 98
    Height = 25
    Caption = 'Excluir Pedido'
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object dbGridPedidosVendasIT: TDBGrid
    Left = 8
    Top = 336
    Width = 409
    Height = 185
    DataSource = DM.dsPedidoVendaIT
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnMaisMenosDetalhamento: TButton
    Left = 8
    Top = 264
    Width = 409
    Height = 25
    Caption = 'Mais Detalhamento do Pedido'
    TabOrder = 4
    OnClick = btnMaisMenosDetalhamentoClick
  end
  object btnAdicionarItem: TButton
    Left = 439
    Top = 336
    Width = 98
    Height = 25
    Caption = 'Adicionar Item'
    TabOrder = 5
    OnClick = btnAdicionarItemClick
  end
  object btnRemoverItem: TButton
    Left = 439
    Top = 376
    Width = 98
    Height = 25
    Caption = 'Remover Item'
    TabOrder = 6
  end
end
