unit AdicionarItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TfrmAdicionarItem = class(TForm)
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    lblPesquisarItem: TLabel;
    dbgPedidoVenda: TDBGrid;
    btnPesquisar: TBitBtn;
    Label1: TLabel;
    edtQuantidade: TEdit;
    btnAdicionar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdicionarItem: TfrmAdicionarItem;

implementation

{$R *.dfm}

procedure TfrmAdicionarItem.btnCancelarClick(Sender: TObject);
begin
  frmAdicionarItem.Destroy;
end;

end.
