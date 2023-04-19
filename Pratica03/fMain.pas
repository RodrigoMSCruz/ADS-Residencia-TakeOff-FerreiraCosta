unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmMain = class(TForm)
    Header1: THeader;
    pnlMain: TPanel;
    Label2: TLabel;
    edtSenha: TEdit;
    btnOk: TButton;
    btnSair: TButton;
    lblMsg: TLabel;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    edtEmail: TEdit;
    procedure Sair1Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses fAula5, fDMUsuario;

procedure TfrmMain.btnGravarClick(Sender: TObject);
begin
  {
  dmUsuario.insUsuario.CommandText.Clear;
  dmUsuario.insUsuario.CommandText.Text := 'insert into usuarios (email, nome, senha) values ('''+edtEmail.Text+''','''+edtNome.Text+''','''+edtSenha.Text+''')';
  dmUsuario.insUsuario.Active := True;
  }
end;

procedure TfrmMain.btnOkClick(Sender: TObject);
var
  untAula5 : TForm;
begin
  dmUsuario.qryUsuario.SQL.Clear;
  dmUsuario.qryUsuario.SQL.Text := 'select * from usuarios where email = '''+edtEmail.Text+''' and senha = ''' + edtSenha.Text + '''';
  dmUsuario.qryUsuario.Open;
  if not dmUsuario.qryUsuario.IsEmpty then
    begin
      try
         untAula5 := TfrmAula5.Create(Application);
         untAula5.ShowModal();
      finally
         FreeAndNil(untAula5);
      end;
    end
  else
    begin
    lblMsg.Caption := 'Usuario e senha invalidos';
  end;

  {
  if ((edtUsuario.Text='unit') and (edtSenha.Text='unit')) then
    begin
      try
         unt3 := TfrmAula5.Create(Application);
         unt3.ShowModal();
      finally
         FreeAndNil(unt3);
      end;
    end;
   }
end;

procedure TfrmMain.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     edtSenha.PasswordChar := #0
  else
     edtSenha.PasswordChar := Char('*');
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if not (dmUsuario.dbConnMySQL.Connected) then
     begin
     dmUsuario.dbConnMySQL.Connected := True;
  end;
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
