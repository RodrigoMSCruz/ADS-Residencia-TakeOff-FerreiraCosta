unit AdicionarItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls;

type
  TfrmAdicionarItem = class(TForm)
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    lblPesquisarItem: TLabel;
    btnPesquisar: TBitBtn;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    btnAdicionar: TButton;
    btnCancelar: TButton;
    lblItem: TLabel;
    lblPreco: TLabel;
    dbtxtItem: TDBText;
    dbtPreco: TDBText;
    lblTotal: TLabel;
    lblValorTotal: TLabel;
    btnCalcular: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdicionarItem: TfrmAdicionarItem;

implementation

{$R *.dfm}

uses DataModule, Data.Win.ADODB, Pedidos;



procedure TfrmAdicionarItem.FormCreate(Sender: TObject);
begin
  dbtxtItem.Caption := '';
  dbtPreco.Caption := '';
  edtQuantidade.Text := '1';
end;

procedure TfrmAdicionarItem.btnPesquisarClick(Sender: TObject);
var
  preco, qtd, total : double;
begin

  DM.ADOQryProdutoEstoque.Close;
  DM.ADOQryProdutoEstoque.SQL.Clear;
  DM.ADOQryProdutoEstoque.SQL.Text := 'SELECT Codigo, Descricao, Preco FROM SFC_PRODUTOS_ESTOQUE WHERE Codigo = :p_Codigo';
  DM.ADOQryProdutoEstoque.Parameters.ParamByName('p_codigo').value := StrToInt(edtCodigo.Text);
  DM.ADOQryProdutoEstoque.Open;

  edtQuantidade.Text := '1';
  preco := DM.ADOQryProdutoEstoque.FieldByName('Preco').AsFloat;
  qtd := strtofloat(edtQuantidade.Text);
  total := preco * qtd;
  lblValorTotal.Caption := floattostr(total);

  if DM.ADOQryProdutoEstoque.isEmpty then
  begin
      ShowMessage('Não há item cadastrado com esse código.');
      edtCodigo.Text :='';
      edtCodigo.SetFocus;
  end;
end;



procedure TfrmAdicionarItem.btnAdicionarClick(Sender: TObject);
var
  Command: TADOCommand;
begin

  Command := TADOCommand.Create(nil);

  try

    Command.Connection := DM.ADOConnection1;
    Command.CommandText := 'INSERT INTO SFC_PEDIDO_VENDA_IT (Tipo, Nota, Datamovim, Fornecedor, Codigo, Qtd, Precounit, Precototal) VALUES(:p_tipoVenda, :p_nota, getDate(), :p_fornecedor, :p_codigo, :p_qtd, :p_precounit, :p_precototal)';
    Command.Parameters.ParamByName('p_tipoVenda').Value := 'VD';
    Command.Parameters.ParamByName('p_nota').Value := DM.ADOQryPedidoVenda.FieldByName('Nota').Value;
    Command.Parameters.ParamByName('p_fornecedor').Value := '10230480001960';
    Command.Parameters.ParamByName('p_codigo').Value := DM.ADOQryProdutoEstoque.FieldByName('Codigo').Value;
    Command.Parameters.ParamByName('p_qtd').Value := StrtoInt(edtQuantidade.Text);
    Command.Parameters.ParamByName('p_precounit').Value := DM.ADOQryProdutoEstoque.FieldByName('Preco').Value;
    Command.Parameters.ParamByName('p_precototal').Value := strtofloat(lblValorTotal.Caption);

    Command.Execute;
  finally
    Command.Free;
  end;


  DM.ADOQryPedidoVendaIT.Close;
  DM.ADOQryPedidoVendaIT.SQL.Clear;
  DM.ADOQryPedidoVendaIT.SQL.Text := 'SELECT A.Fornecedor, A.Codigo, B.Descricao, A.Qtd, A.Precounit, A.Precototal FROM SFC_PEDIDO_VENDA_IT AS A INNER JOIN SFC_PRODUTOS_ESTOQUE AS B ON A.Codigo = B.Codigo WHERE Nota = :p_Nota';
  DM.ADOQryPedidoVendaIT.Parameters.ParamByName('p_Nota').value := DM.ADOQryPedidoVenda.FieldByName('Nota').value;
  DM.ADOQryPedidoVendaIT.Open;

  frmPedidos.dbGridPedidosVendasIT.Columns[2].Width := 150;

 // SELECT DISTINCT A.Tipo, A.Nota, A.Datamovim AS DataMovimento,
 //                 A.Fornecedor, C.Total AS ValorTotal
 // FROM SFC_PEDIDO_VENDA AS A
 // LEFT JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota
 // LEFT JOIN (
 //   SELECT A.Nota, Sum(B.Precototal) As Total
 //   FROM SFC_PEDIDO_VENDA AS A
 //   INNER JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota
 //   GROUP BY A.Nota) AS C ON C.Nota = A.Nota';


  DM.ADOQryPedidoVenda.Close;
  DM.ADOQryPedidoVenda.SQL.Clear;
  DM.ADOqryPedidoVenda.SQL.Text := 'SELECT DISTINCT A.Tipo, A.Nota, A.Datamovim AS DataMovimento, A.Fornecedor, C.Total AS ValorTotal FROM SFC_PEDIDO_VENDA AS A ';
  DM.ADOQryPedidoVenda.SQL.Text := DM.ADOQryPedidoVenda.SQL.Text + ' LEFT JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota LEFT JOIN';
  DM.ADOQryPedidoVenda.SQL.Text := DM.ADOQryPedidoVenda.SQL.Text + ' (SELECT A.Nota, Sum(B.Precototal) As Total FROM SFC_PEDIDO_VENDA AS A INNER JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota GROUP BY A.Nota) AS C ON C.Nota = A.Nota';
  DM.ADOqryPedidoVenda.Open;
end;

procedure TfrmAdicionarItem.btnCalcularClick(Sender: TObject);
var
  preco, qtd, total : double;
begin
  preco := DM.ADOQryProdutoEstoque.FieldByName('Preco').AsFloat;
  qtd := strtofloat(edtQuantidade.Text);
  total := preco * qtd;
  lblValorTotal.Caption := floattostr(total);
end;

procedure TfrmAdicionarItem.btnCancelarClick(Sender: TObject);
begin
  frmAdicionarItem.close;
end;


end.
