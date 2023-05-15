unit Pedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Menus;

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
    mmMenu: TMainMenu;
    Pedidos1: TMenuItem;
    Sobre1: TMenuItem;
    Repositrio1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnGerarPedidoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnMaisMenosDetalhamentoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Repositrio1Click(Sender: TObject);
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

  //Efeitos visuais
  btnGerarPedido.Enabled := True;
  btnExcluir.Enabled := True;
  btnMaisMenosDetalhamento.Caption := 'Mais Detalhamento do Pedido';

  lblItensDePedido.Enabled := False;
  dbGridPedidosVendasIT.Enabled := False;
  btnAdicionarItem.Enabled := False;
  btnRemoverItem.Enabled := False;
end;


procedure TfrmPedidos.Sobre1Click(Sender: TObject);
begin
  ShowMessage('Aplicação desenvolvida por Rodrigo de Moraes Santa Cruz como projeto de Avaliação da Residência entre Unit e Ferreira Costa.');
  ShowMessage('LinkedIn: https://www.linkedin.com/ln/rodrigo-de-moraes-santa-cruz-86a09083/');
end;

procedure TfrmPedidos.Repositrio1Click(Sender: TObject);
begin
  ShowMessage('https://github.com/RodrigoMSCruz/ADS-Residencia-TakeOff-FerreiraCosta');
end;

procedure TfrmPedidos.btnGerarPedidoClick(Sender: TObject);
var Command: TADOCommand;
begin
  Command := TADOCommand.Create(nil);
  try

    // INSERT INTO SFC_PEDIDO_VENDA (Tipo, Datamovim, Fornecedor)
    // VALUES(:p_tipoVenda, getDate(), :p_fornecedor)

    Command.Connection := DM.ADOConnection1;
    Command.CommandText := 'INSERT INTO SFC_PEDIDO_VENDA (Tipo, Datamovim, Fornecedor) VALUES(:p_tipoVenda, getDate(), :p_fornecedor)';
    Command.Parameters.ParamByName('p_tipoVenda').Value := 'VD';
    Command.Parameters.ParamByName('p_fornecedor').Value := '10230480001960';
    Command.Execute;
  finally
    Command.Free;
  end;

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


procedure TfrmPedidos.btnExcluirClick(Sender: TObject);
var Command, CommandCascade: TADOCommand;
begin
  CommandCascade := TADOCommand.Create(nil);

  // Deleção em cascata - Primeiro deleta os registos em SFC_PEDIDO_VENDA
  //                      filhos de SFC_PEDIDO_VENDA

  // DELETE FROM SFC_PEDIDO_VENDA_IT
  // WHERE Nota = :p_Nota

  try
    CommandCascade.Connection := DM.ADOConnection1;
    CommandCascade.CommandText := 'DELETE FROM SFC_PEDIDO_VENDA_IT WHERE Nota = :p_Nota';
    CommandCascade.Parameters.ParamByName('p_Nota').Value := DM.ADOQryPedidoVenda.FieldByName('Nota').Value;
    CommandCascade.Execute;
  finally
    CommandCascade.Free;
  end;

  //DELETE FROM SFC_PEDIDO_VENDA WHERE Nota = :p_Nota

  Command := TADOCommand.Create(nil);
  try
    Command.Connection := DM.ADOConnection1;
    Command.CommandText := 'DELETE FROM SFC_PEDIDO_VENDA WHERE Nota = :p_Nota';
    Command.Parameters.ParamByName('p_Nota').Value := DM.ADOQryPedidoVenda.FieldByName('Nota').Value;
    Command.Execute;
  finally
    Command.Free;
  end;

 // Atualiza a query

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

procedure TfrmPedidos.btnMaisMenosDetalhamentoClick(Sender: TObject);
begin

  //Efeitos visuais
  if dbGridPedidosVendasIT.Enabled = True then
  begin
    btnGerarPedido.Enabled := True;
    btnExcluir.Enabled := True;
    btnMaisMenosDetalhamento.Caption := 'Mais Detalhamento do Pedido';

    lblItensDePedido.Enabled := False;
    dbGridPedidosVendasIT.Enabled := False;
    btnAdicionarItem.Enabled := False;
    btnRemoverItem.Enabled := False;
  end
  else begin
    btnGerarPedido.Enabled := False;
    btnExcluir.Enabled := False;
    btnMaisMenosDetalhamento.Caption := 'Menos Detalhamento do Pedido';

    lblItensDePedido.Enabled := True;
    dbGridPedidosVendasIT.Enabled := True;
    btnAdicionarItem.Enabled := True;
    btnRemoverItem.Enabled := True;
  end;

  //Operação do banco  - Mostra os dados dos pedidos de SFC_PEDIDO_IT
  //                     do registro de SFC_PEDIDO selecionado no grid

  // SELECT A.Fornecedor, A.Codigo, B.Descricao, A.Qtd, A.Precounit, A.Precototal
  // FROM SFC_PEDIDO_VENDA_IT AS A
  // INNER JOIN SFC_PRODUTOS_ESTOQUE AS B
  // ON A.Codigo = B.Codigo
  // WHERE Nota = :p_Nota

  DM.ADOQryPedidoVendaIT.Close;
  DM.ADOQryPedidoVendaIT.SQL.Clear;
  DM.ADOQryPedidoVendaIT.SQL.Text := 'SELECT A.Fornecedor, A.Codigo, B.Descricao, A.Qtd, A.Precounit, A.Precototal FROM SFC_PEDIDO_VENDA_IT AS A INNER JOIN SFC_PRODUTOS_ESTOQUE AS B ON A.Codigo = B.Codigo WHERE Nota = :p_Nota';
  DM.ADOQryPedidoVendaIT.Parameters.ParamByName('p_Nota').value := DM.ADOQryPedidoVenda.FieldByName('Nota').value;
  DM.ADOQryPedidoVendaIT.Open;

  //Ajuste em uma coluna do grid
  dbGridPedidosVendasIT.Columns[2].Width := 150;

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


procedure TfrmPedidos.btnRemoverItemClick(Sender: TObject);
var Command: TADOCommand;
begin
  Command := TADOCommand.Create(nil);

  // DELETE FROM SFC_PEDIDO_VENDA_IT
  // WHERE Nota = :p_Nota AND Codigo = :p_Codigo

  try
    Command.Connection := DM.ADOConnection1;
    Command.CommandText := 'DELETE FROM SFC_PEDIDO_VENDA_IT WHERE Nota = :p_Nota AND Codigo = :p_Codigo';
    Command.Parameters.ParamByName('p_Nota').Value := DM.ADOQryPedidoVenda.FieldByName('Nota').Value;
    Command.Parameters.ParamByName('p_Codigo').Value := DM.ADOQryPedidoVendaIT.FieldByName('Codigo').Value;
    Command.Execute;
  finally
    Command.Free;
  end;

  //Operação do banco - Atualiza Pedido_Venda_IT
  DM.ADOQryPedidoVendaIT.Close;
  DM.ADOQryPedidoVendaIT.SQL.Clear;
  DM.ADOQryPedidoVendaIT.SQL.Text := 'SELECT A.Fornecedor, A.Codigo, B.Descricao, A.Qtd, A.Precounit, A.Precototal FROM SFC_PEDIDO_VENDA_IT AS A INNER JOIN SFC_PRODUTOS_ESTOQUE AS B ON A.Codigo = B.Codigo WHERE Nota = :p_Nota';
  DM.ADOQryPedidoVendaIT.Parameters.ParamByName('p_Nota').value := DM.ADOQryPedidoVenda.FieldByName('Nota').value;
  DM.ADOQryPedidoVendaIT.Open;

  //Ajuste em uma coluna do grid
  dbGridPedidosVendasIT.Columns[2].Width := 150;

end;

end.
