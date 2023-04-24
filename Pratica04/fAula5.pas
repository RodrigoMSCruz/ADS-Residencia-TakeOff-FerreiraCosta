unit fAula5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus;

type
  TfrmAula5 = class(TForm)
    mainMnu: TMainMenu;
    Sair1: TMenuItem;
    pnlMain: TPanel;
    lblMsg: TLabel;
    Header1: THeader;
    File1: TMenuItem;
    Abrir1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAula5: TfrmAula5;

implementation

{$R *.dfm}

uses fMain, fCadCliente;

procedure TfrmAula5.Abrir1Click(Sender: TObject);
var
  cadCli : TfrmCadCliente;
begin
      try
         cadCli := TfrmCadCliente.Create(Application);
         cadCli.ShowModal();
      finally
         FreeAndNil(cadCli);
      end;
end;

procedure TfrmAula5.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
