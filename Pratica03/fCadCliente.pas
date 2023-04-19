unit fCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCelular: TMaskEdit;
    Label5: TLabel;
    edtCEP: TMaskEdit;
    Label6: TLabel;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    Label7: TLabel;
    edtCidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    cbxUF: TComboBox;
    DBGrid1: TDBGrid;
    dsCliente: TDataSource;
    qryCliente: TFDQuery;
    btnInserir: TButton;
    insCliente: TFDQuery;
    edtDtNasc: TMaskEdit;
    btnExcluir: TButton;
    delCliente: TFDQuery;
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses fDMUsuario;


procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
  try
    //qryCliente.
    delCliente.SQL.Clear;
    delCliente.SQL.Text := 'delete from cliente where id = :id';
    delCliente.ParamByName('id').AsInteger := qryCliente.FieldByName('id').AsInteger;
    delCliente.ExecSQL;
    ShowMessage('Cliente excluido com sucesso');
  except
    ShowMessage('Erro na exclusão do cliente');
  end;
end;

procedure TfrmCadCliente.btnInserirClick(Sender: TObject);
begin
  try
    insCliente.SQL.Clear;
    insCliente.SQL.Text := 'insert into cliente (nome, email, dt_nasc, celular, cep, endereco, bairro, cidade, uf) values (:p_nome, :p_email, :p_dt_nasc, :p_celular, :p_cep, :p_endereco, :p_bairro, :p_cidade, :p_uf)';
    insCliente.ParamByName('p_nome').AsString      := Trim(edtNome.Text);
    insCliente.ParamByName('p_email').AsString     := Trim(edtEmail.Text);
    insCliente.ParamByName('p_dt_nasc').AsDateTime := StrToDate(edtDtNasc.Text);
    insCliente.ParamByName('p_celular').AsString   := Trim(edtCelular.Text);
    insCliente.ParamByName('p_cep').AsInteger      := StrToInt(Trim(edtCEP.Text));
    insCliente.ParamByName('p_endereco').AsString  := Trim(edtEndereco.Text);
    insCliente.ParamByName('p_bairro').AsString    := Trim(edtBairro.Text);
    insCliente.ParamByName('p_cidade').AsString    := Trim(edtCidade.Text);
    insCliente.ParamByName('p_uf').AsString        := Trim(cbxUF.Text);
    insCliente.ExecSQL;
    qryCliente.SQL.Clear;
    qryCliente.SQL.Text := 'select * from cliente';
    qryCliente.Open;
    ShowMessage('Inclusão ocorreu com sucesso.');
  except
    ShowMessage('Erro na inclusão do registro!');
  end;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
    qryCliente.SQL.Clear;
    qryCliente.SQL.Text := 'select * from cliente';
    qryCliente.Open;
end;

end.
