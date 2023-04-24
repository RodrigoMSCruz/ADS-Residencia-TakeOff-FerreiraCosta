program Aula_5;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {frmMain},
  fAula5 in 'fAula5.pas' {frmAula5},
  fDMUsuario in 'fDMUsuario.pas' {dmUsuario: TDataModule},
  fCadCliente in 'fCadCliente.pas' {frmCadCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmUsuario, dmUsuario);
  Application.Run;
end.
