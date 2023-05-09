unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Data.Win.ADODB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    dsPedidoVenda: TDataSource;
    ADOQryPedidoVenda: TADOQuery;
    ADOCommandPedidoVenda: TADOCommand;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ADOConnection1.Connected := False;
  ADOConnection1.ConnectionString := ADOConnection1.ConnectionString + ';datasource=DESKTOP-0CB2SE4\SQLEXPRESS' + 'initial catalog=sfc_bd';
  ADOConnection1.Connected := True;
end;

end.
