program Cadastro;

uses
  Vcl.Forms,
  Inscricao in 'Inscricao.pas' {frmInscricao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInscricao, frmInscricao);
  Application.Run;
end.
