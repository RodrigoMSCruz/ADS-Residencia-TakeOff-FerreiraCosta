program Avaliacao;

uses
  Vcl.Forms,
  Pedidos in 'Pedidos.pas' {frmPedidos},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  AdicionarItem in 'AdicionarItem.pas' {frmAdicionarItem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.Run;
end.
