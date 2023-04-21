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
    btnEditar: TButton;
    edtCliente: TFDQuery;
    btnOK: TButton;
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
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



procedure TfrmCadCliente.btnEditarClick(Sender: TObject);
var id : integer;
begin
  try
    qryCliente.SQL.Clear;
    qryCliente.SQL.Text := 'select * from cliente';
    id := qryCliente.FieldByName('id').AsInteger;
    qryCliente.Open;

    edtCliente.SQL.Clear;
    edtCliente.SQL.Text := 'select * from cliente where id = :p_id';
    edtCliente.ParamByName('p_id').AsInteger := id;
    edtCliente.Open;

    edtNome.Text := edtCliente.FieldByName('nome').AsString;
    edtEmail.Text := edtCliente.FieldByName('email').AsString;
    edtDtNasc.Text := edtCliente.FieldByName('dt_nasc').AsString;
    edtCelular.Text := edtCliente.FieldByName('celular').AsString;
    edtCEP.Text := edtCliente.FieldByName('cep').AsString;
    edtEndereco.Text := edtCliente.FieldByName('endereco').AsString;
    edtBairro.Text := edtCliente.FieldByName('bairro').AsString;
    edtCidade.Text := edtCliente.FieldByName('cidade').AsString;
    cbxUF.Text := edtCliente.FieldByName('uf').AsString;

    btnOK.Visible := True;
  except
    ShowMessage('Erro na busca de cliente para editar.');
  end;

end;

procedure TfrmCadCliente.btnOKClick(Sender: TObject);
begin
try
    edtCliente.SQL.Clear;
    edtCliente.SQL.Text := 'update cliente set nome = :p_nome, email = :p_email, dt_nasc = :p_dt_nasc, celular = :p_celular, cep = :p_cep, endereco = :p_endereco, bairro = :p_bairro, cidade = :p_cidade, uf = :p_uf)';
    edtCliente.ParamByName('p_nome').AsString      := Trim(edtNome.Text);
    edtCliente.ParamByName('p_email').AsString     := Trim(edtEmail.Text);
    edtCliente.ParamByName('p_dt_nasc').AsDateTime := StrToDate(edtDtNasc.Text);
    edtCliente.ParamByName('p_celular').AsString   := Trim(edtCelular.Text);
    edtCliente.ParamByName('p_cep').AsInteger      := StrToInt(Trim(edtCEP.Text));
    edtCliente.ParamByName('p_endereco').AsString  := Trim(edtEndereco.Text);
    edtCliente.ParamByName('p_bairro').AsString    := Trim(edtBairro.Text);
    edtCliente.ParamByName('p_cidade').AsString    := Trim(edtCidade.Text);
    edtCliente.ParamByName('p_uf').AsString        := Trim(cbxUF.Text);
    edtCliente.ExecSQL;
    edtCliente.SQL.Clear;

    qryCliente.SQL.Clear;
    qryCliente.SQL.Text := 'select * from cliente';
    qryCliente.Open;
    ShowMessage('Edição ocorreu com sucesso.');
  except
    ShowMessage('Erro naedição do registro!');
  end;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
    btnOK.Visible := False;
    qryCliente.SQL.Clear;
    qryCliente.SQL.Text := 'select * from cliente';
    qryCliente.Open;
end;

end.
