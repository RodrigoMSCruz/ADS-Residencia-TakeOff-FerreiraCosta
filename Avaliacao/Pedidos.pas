unit Pedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmPedidos = class(TForm)
    dbGridPedidosVendas: TDBGrid;
    btnGerarPedido: TButton;
    lblPedidoDeVendas: TLabel;
    btnExcluir: TButton;
    dbGridPedidosVendasIT: TDBGrid;
    btnMaisMenosDetalhamento: TButton;
    lblItensDePedido: TLabel;
    btnAdicionarItem: TButton;
    btnRemoverItem: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGerarPedidoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnMaisMenosDetalhamentoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses DataModule, Data.Win.ADODB, AdicionarItem;



procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  DM.ADOQryPedidoVenda.Close;
  DM.ADOQryPedidoVenda.SQL.Clear;
  DM.ADOqryPedidoVenda.SQL.Text := 'Select Nota, Datamovim, Fornecedor, ValorTotal from SFC_PEDIDO_VENDA';
  DM.ADOqryPedidoVenda.Open;
end;



procedure TfrmPedidos.btnGerarPedidoClick(Sender: TObject);
var Command: TADOCommand;
begin
  Command := TADOCommand.Create(nil);
  try
    Command.Connection := DM.ADOConnection1;
    Command.CommandText := 'INSERT INTO SFC_PEDIDO_VENDA (Tipo, Datamovim, Fornecedor, ValorTotal) VALUES(:p_tipoVenda, getDate(), :p_fornecedor, 0)';
    Command.Parameters.ParamByName('p_tipoVenda').Value := 'VD';
    Command.Parameters.ParamByName('p_fornecedor').Value := '10230480001960';
    Command.Execute;
  finally
    Command.Free;
  end;

  DM.ADOQryPedidoVenda.Close;
  DM.ADOQryPedidoVenda.SQL.Clear;
  DM.ADOqryPedidoVenda.SQL.Text := 'Select Nota, Datamovim, Fornecedor, ValorTotal from SFC_PEDIDO_VENDA';
  DM.ADOqryPedidoVenda.Open;
end;


procedure TfrmPedidos.btnExcluirClick(Sender: TObject);
var Command: TADOCommand;
begin
  Command := TADOCommand.Create(nil);
  try
    Command.Connection := DM.ADOConnection1;
    Command.CommandText := 'DELETE FROM SFC_PEDIDO_VENDA WHERE Nota = :p_Nota';
    Command.Parameters.ParamByName('p_Nota').Value := DM.ADOQryPedidoVenda.FieldByName('Nota').Value;
    Command.Execute;
  finally
    Command.Free;
  end;

  DM.ADOQryPedidoVenda.Close;
  DM.ADOQryPedidoVenda.SQL.Clear;
  DM.ADOqryPedidoVenda.SQL.Text := 'Select Nota, Datamovim, Fornecedor, ValorTotal from SFC_PEDIDO_VENDA';
  DM.ADOqryPedidoVenda.Open;

end;

procedure TfrmPedidos.btnMaisMenosDetalhamentoClick(Sender: TObject);
begin

  DM.ADOQryPedidoVendaIT.Close;
  DM.ADOQryPedidoVendaIT.SQL.Clear;
  DM.ADOQryPedidoVendaIT.SQL.Text := 'SELECT A.Fornecedor, A.Codigo, B.Descricao, A.Qtd, A.Precounit, A.Precototal FROM SFC_PEDIDO_VENDA_IT AS A INNER JOIN SFC_PRODUTOS_ESTOQUE AS B ON A.Codigo = B.Codigo WHERE Nota = :p_Nota';
  DM.ADOQryPedidoVendaIT.Parameters.ParamByName('p_Nota').value := DM.ADOQryPedidoVenda.FieldByName('Nota').value;
  DM.ADOQryPedidoVendaIT.Open;

end;

procedure TfrmPedidos.btnAdicionarItemClick(Sender: TObject);
var adicionarItem : TForm;
begin
  try
    adicionarItem := TfrmAdicionarItem.Create(Application);
    adicionarItem.ShowModal();
  finally
    FreeAndNil(adicionarItem);
  end;
end;

end.
