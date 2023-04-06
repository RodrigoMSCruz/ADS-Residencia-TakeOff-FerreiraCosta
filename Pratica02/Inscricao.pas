unit Inscricao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmInscricao = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    edNomeSocial: TEdit;
    rgNomeSocial: TRadioGroup;
    rbNome: TRadioButton;
    rbNomeSocial: TRadioButton;
    lblSexo: TLabel;
    cbSexo: TComboBox;
    lblDataNascimento: TLabel;
    meDataNascimento: TMaskEdit;
    Edit1: TEdit;
    lblEmail: TLabel;
    lblCPF: TLabel;
    meCPF: TMaskEdit;
    meFone: TMaskEdit;
    lblFone: TLabel;
    pnlIscricao: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInscricao: TfrmInscricao;

implementation

{$R *.dfm}

end.
