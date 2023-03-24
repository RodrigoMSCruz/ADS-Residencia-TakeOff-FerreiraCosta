program Project01;

uses
  Vcl.Forms,
  Pratica01 in 'Pratica01.pas' {frmPratica01};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPratica01, frmPratica01);
  Application.Run;
end.
