program Cadastro;

uses
  Vcl.Forms,
  Inscricao in 'Inscricao.pas' {frmFuncionarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFuncionarios, frmFuncionarios);
  Application.Run;
end.
