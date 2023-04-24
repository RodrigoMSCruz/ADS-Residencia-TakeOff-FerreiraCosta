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
    btnGravar: TButton;
    fdTransaction: TFDTransaction;
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
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


procedure TfrmCadCliente.btnEditarClick(Sender: TObject);
begin
//  idCliente        := qryCliente.FieldByName('id').AsInteger;
  edtNome.Text     := qryCliente.FieldByName('nome').AsString;
  edtEmail.Text    := qryCliente.FieldByName('email').AsString;
  edtDtNasc.Text   := StringReplace(qryCliente.FieldByName('dt_nasc').AsString, '/', '', [rfReplaceAll]) ;
  edtCelular.Text  := qryCliente.FieldByName('celular').AsString;
  edtCEP.Text      := qryCliente.FieldByName('cep').AsString;
  edtEndereco.Text := qryCliente.FieldByName('endereco').AsString;
  edtBairro.Text   := qryCliente.FieldByName('bairro').AsString;
  edtCidade.Text   := qryCliente.FieldByName('cidade').AsString;
  cbxUF.Text       := qryCliente.FieldByName('uf').AsString;
end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
  try
    //qryCliente.
    delCliente.SQL.Clear;
    delCliente.SQL.Text := 'delete from cliente where id = :id';
    delCliente.ParamByName('id').AsInteger := qryCliente.FieldByName('id').AsInteger;
    delCliente.ExecSQL;
    fdTransaction.Commit;
    ShowMessage('Cliente excluido com sucesso');
  except
    fdTransaction.Rollback;
    ShowMessage('Erro na exclusão do cliente');
  end;
end;

procedure TfrmCadCliente.btnGravarClick(Sender: TObject);
var
  fmtStrings: TFormatSettings;
  sqlTxt : String;
begin
  fmtStrings.ShortDateFormat := 'yyyy-mm-dd';
  sqlTxt := 'update cliente                 ' + chr(13)+chr(10) +
            '   set nome     = :p_nome    , ' + chr(13)+chr(10) +
            '       email    = :p_email   , ' + chr(13)+chr(10) +
            '       dt_nasc  = :p_dt_nasc , ' + chr(13)+chr(10) +
            '       celular  = :p_celular , ' + chr(13)+chr(10) +
            '       cep      = :p_cep     , ' + chr(13)+chr(10) +
            '       endereco = :p_endereco, ' + chr(13)+chr(10) +
            '       bairro   = :p_bairro  , ' + chr(13)+chr(10) +
            '       cidade   = :p_cidade  , ' + chr(13)+chr(10) +
            '       uf       = :p_uf        ' + chr(13)+chr(10) +
            ' where id       = :p_id        ';
  try
    insCliente.SQL.Clear;
    insCliente.SQL.Text := sqlTxt;
    insCliente.ParamByName('p_nome').AsString      := Trim(edtNome.Text);
    insCliente.ParamByName('p_email').AsString     := Trim(edtEmail.Text);
    // insCliente.ParamByName('p_dt_nasc').AsDateTime := FormatDateTime('dd/mm/yyyy', StrToDateTIme(edtDtNasc.Text));
    insCliente.ParamByName('p_dt_nasc').AsDateTime := StrToDateTime(Copy(edtDtNasc.Text,1,2)+'/'+Copy(edtDtNasc.Text,3,2)+'/'+Copy(edtDtNasc.Text,5,4));
    insCliente.ParamByName('p_celular').AsString   := Trim(edtCelular.Text);
    insCliente.ParamByName('p_cep').AsInteger      := StrToInt(Trim(edtCEP.Text));
    insCliente.ParamByName('p_endereco').AsString  := Trim(edtEndereco.Text);
    insCliente.ParamByName('p_bairro').AsString    := Trim(edtBairro.Text);
    insCliente.ParamByName('p_cidade').AsString    := Trim(edtCidade.Text);
    insCliente.ParamByName('p_uf').AsString        := Trim(cbxUF.Text);
    insCliente.ParamByName('p_id').AsInteger       := qryCliente.FieldByName('id').AsInteger;
    insCliente.ExecSQL;
    qryCliente.SQL.Clear;
    qryCliente.SQL.Text := 'select * from cliente';
    qryCliente.Open;
    ShowMessage('Alteração ocorreu com sucesso.');
  except
    ShowMessage('Erro na alteração do registro!');
  end;
end;

procedure TfrmCadCliente.btnInserirClick(Sender: TObject);
begin
  try
    fdTransaction.StartTransaction;
    insCliente.SQL.Clear;
    insCliente.SQL.Text := 'insert into cliente (nome, email, dt_nasc, celular, cep, endereco, bairro, cidade, uf) values (:p_nome, :p_email, :p_dt_nasc, :p_celular, :p_cep, :p_endereco, :p_bairro, :p_cidade, :p_uf)';
    insCliente.ParamByName('p_nome').AsString      := Trim(edtNome.Text);
    insCliente.ParamByName('p_email').AsString     := Trim(edtEmail.Text);
    insCliente.ParamByName('p_dt_nasc').AsDateTime := StrToDate(Copy(edtDtNasc.Text,1,2)+'/'+Copy(edtDtNasc.Text,3,2)+'/'+Copy(edtDtNasc.Text,5,4));
    insCliente.ParamByName('p_celular').AsString   := Trim(edtCelular.Text);
    insCliente.ParamByName('p_cep').AsInteger      := StrToInt(Trim(edtCEP.Text));
    insCliente.ParamByName('p_endereco').AsString  := Trim(edtEndereco.Text);
    insCliente.ParamByName('p_bairro').AsString    := Trim(edtBairro.Text);
    insCliente.ParamByName('p_cidade').AsString    := Trim(edtCidade.Text);
    insCliente.ParamByName('p_uf').AsString        := Trim(cbxUF.Text);
    insCliente.ExecSQL;
    fdTransaction.Commit;
    qryCliente.SQL.Clear;
    qryCliente.SQL.Text := 'select * from cliente';
    qryCliente.Open;
    ShowMessage('Inclusão ocorreu com sucesso.');


    /// outro insert




  except
    fdTransaction.Rollback;
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
