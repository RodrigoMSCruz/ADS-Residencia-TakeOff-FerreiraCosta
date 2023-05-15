object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 542
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
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
    Width = 537
    Height = 185
    DataSource = DM.dsPedidoVendaIT
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnMaisMenosDetalhamento: TButton
    Left = 8
    Top = 247
    Width = 409
    Height = 42
    Caption = 'Mais Detalhamento do Pedido'
    TabOrder = 4
    OnClick = btnMaisMenosDetalhamentoClick
  end
  object btnAdicionarItem: TButton
    Left = 551
    Top = 336
    Width = 98
    Height = 25
    Caption = 'Adicionar Item'
    TabOrder = 5
    OnClick = btnAdicionarItemClick
  end
  object btnRemoverItem: TButton
    Left = 551
    Top = 367
    Width = 98
    Height = 25
    Caption = 'Remover Item'
    TabOrder = 6
    OnClick = btnRemoverItemClick
  end
  object mmMenu: TMainMenu
    Left = 632
    object Pedidos1: TMenuItem
      Caption = 'Menu'
      object Sobre1: TMenuItem
        Caption = 'Sobre...'
        OnClick = Sobre1Click
      end
      object Repositrio1: TMenuItem
        Caption = 'Reposit'#243'rio...'
        OnClick = Repositrio1Click
      end
    end
  end
end
