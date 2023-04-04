unit Pratica01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPratica01 = class(TForm)
    pnlPratica1: TPanel;
    lblNome: TLabel;
    lblSexo: TLabel;
    edtNome: TEdit;
    btnOK: TButton;
    btnFechar: TButton;
    cbxSexo: TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPratica01: TfrmPratica01;

implementation

{$R *.dfm}



procedure TfrmPratica01.btnOKClick(Sender: TObject);
begin
            ShowMessage('Seu nome é ' + edtNome.Text + ' e seu sexo é ' + cbxSexo.Text + '.');
end;

procedure TfrmPratica01.btnFecharClick(Sender: TObject);
begin
  application.Terminate;
end;

end.
